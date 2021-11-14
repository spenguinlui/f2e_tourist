require "uri"
require "net/http"
require "openssl"
require "base64"
require "ostruct"
require "json"
require "zlib"

class ApiPtxData
  def initialize
    @app_id = ENV['PTX_APP_ID']
    @app_key = ENV['PTX_APP_KEY']
    @top ||= "9"
    @select_column ||= ""
    @filter ||= "" # 可以用 and 跟 or 無限接
  end

  def get_citys
    citys = get_response(
      uri: "https://link.motc.gov.tw/v2/Basic/County?$select=County,CountyName&$format=JSON",
      gzip: true
    ).json
    town_data = [
      {
        area: "北部",
        citys: []
      },
      {
        area: "中部",
        citys: []
      },
      {
        area: "南部",
        citys: []
      },
      {
        area: "東部",
        citys: []
      },
      {
        area: "離島",
        citys: []
      },
      {
        area: "其他",
        citys: []
      },
    ]
    citys.map do |city|
      city_name = city["County"]
      city_name_zh = city["CountyName"]
      dists_data = get_response(
        uri: "https://link.motc.gov.tw/v2/Basic/City/#{city_name}/Town?$select=TownName&$format=JSON",
        gzip: true
      ).json
      nouth = ["Taipei", "Keelung", "NewTaipei", "Taoyuan", "HsinchuCounty", "Hsinchu"]
      middle = ["Taichung", "Chiayi", "MiaoliCounty", "NantouCounty", "ChanghuaCounty"]
      south = ["Tainan", "Kaohsiung", "YunlinCounty", "ChiayiCounty", "PingtungCounty"]
      east = ["YilanCounty", "HualienCounty", "TaitungCounty"]
      outside = ["KinmenCounty", "PenghuCounty", "LienchiangCounty"]
      case city_name
      when *nouth
        town_data[0][:citys] << {
          city: city_name,
          city_name: city_name_zh,
          is_open: (city_name == "Taipei" ? true : false),
          dists: dists_data
        }
      when *middle
        town_data[1][:citys] << {
          city: city_name,
          city_name: city_name_zh,
          is_open: false,
          dists: dists_data
        }
      when *south
        town_data[2][:citys] << {
          city: city_name,
          city_name: city_name_zh,
          is_open: false,
          dists: dists_data
        }
      when *east
        town_data[3][:citys] << {
          city: city_name,
          city_name: city_name_zh,
          is_open: false,
          dists: dists_data
        }
      when *outside
        town_data[4][:citys] << {
          city: city_name,
          city_name: city_name_zh,
          is_open: false,
          dists: dists_data
        }
      else
        town_data[5][:citys] << {
          city: city_name,
          city_name: city_name_zh,
          is_open: false,
          dists: dists_data
        }
      end
    end
    town_data
  end

  def get_scenicspots(**params)
    query = []
    query << ["$top", (params[:top] ? params[:top] : @top)]
    params[:select] && query << ["$select", params[:select]]
    params[:filter] && query << ["$filter", get_keyowrds_query(params[:filter][0], params[:filter][1])]
    encode_query = URI.encode_www_form(query)
    get_response(
      uri: "https://ptx.transportdata.tw/MOTC/v2/Tourism/ScenicSpot?$format=JSON&#{encode_query}",
      gzip: true, # 是否壓縮資料
    ).json
  end

  def get_activities(**params)
    query = []
    query << ["$top", (params[:top] ? params[:top] : @top)]
    params[:select] && query << ["$select", params[:select]]
    params[:filter] && query << ["$filter", get_keyowrds_query(params[:filter][0], params[:filter][1])]
    encode_query = URI.encode_www_form(query)
    get_response(
      uri: "https://ptx.transportdata.tw/MOTC/v2/Tourism/Activity?$format=JSON&#{encode_query}",
      gzip: true, # 是否壓縮資料
    ).json
  end

  def get_restaurants(**params)
    query = []
    query << ["$top", (params[:top] ? params[:top] : @top)]
    params[:select] && query << ["$select", params[:select]]
    params[:filter] && query << ["$filter", get_keyowrds_query(params[:filter][0], params[:filter][1])]
    encode_query = URI.encode_www_form(query)
    get_response(
      uri: "https://ptx.transportdata.tw/MOTC/v2/Tourism/Restaurant?$format=JSON&#{encode_query}",
      gzip: true, # 是否壓縮資料
    ).json
  end

  def get_hotels(**params)
    query = []
    query << ["$top", (params[:top] ? params[:top] : @top)]
    params[:select] && query << ["$select", params[:select]]
    params[:filter] && query << ["$filter", get_keyowrds_query(params[:filter][0], params[:filter][1])]
    encode_query = URI.encode_www_form(query)
    get_response(
      uri: "https://ptx.transportdata.tw/MOTC/v2/Tourism/Hotel?$format=JSON&&#{encode_query}",
      gzip: true, # 是否壓縮資料
    ).json
  end

  # 城市列表
  # "https://link.motc.gov.tw/v2/Basic/County?$format=JSON"

  # 景觀列表
  # "https://ptx.transportdata.tw/MOTC/v2/Tourism/ScenicSpot?$format=JSON"

  # 活動列表
  # "https://ptx.transportdata.tw/MOTC/v2/Tourism/Activity?$format=JSON"

  # 餐廳列表
  # "https://ptx.transportdata.tw/MOTC/v2/Tourism/Restaurant?$format=JSON"

  # 住宿列表
  # "https://ptx.transportdata.tw/MOTC/v2/Tourism/Hotel?$format=JSON"

  # 台灣好行-所有列表
  # "https://ptx.transportdata.tw/MOTC/v2/Tourism/Bus/Route/TaiwanTrip?$format=JSON"

  # 台灣好行-指定路線動態(含到站時間)
  # "https://ptx.transportdata.tw/MOTC/v2/Tourism/Bus/EstimatedTimeOfArrival/TaiwanTrip/#{路線中文名}?$format=JSON"

  private

  def get_response(uri:, gzip: false, options: {})
    uri_parser = URI.parse(uri)
    timestamp = get_gmt_timestamp
    hmac = encode_by_hmac_sha1(@app_key, 'x-date: ' + timestamp)

    request = Net::HTTP::Get.new(uri_parser)
    request["Accept"] = "application/json"
    request["Accept-Encoding"] = "gzip" if gzip
    request["X-Date"] = timestamp
    request["Authorization"] = %Q(hmac username=\"#{@app_id}\", algorithm=\"hmac-sha1\", headers=\"x-date\", signature=\"#{hmac}\")

    req_options = {
      use_ssl: uri_parser.scheme == "https",
    }.merge(options)

    response = Net::HTTP.start(uri_parser.hostname, uri_parser.port, req_options) do |http|
      http.request(request)
    end

    OpenStruct.new(
      code: response.code,
      json: parse_json_response(response),
      response: response,
    )
  end

  def get_gmt_timestamp
    Time.now.utc.strftime("%a, %d %b %Y %T GMT")
  end

  def encode_by_hmac_sha1(key, value)
    Base64.encode64(
      OpenSSL::HMAC.digest(
        OpenSSL::Digest.new('sha1'),
        key,
        value,
      )
    ).strip()
  end

  def parse_json_response(response)
    response_body = case response.header["content-encoding"]
    when "gzip"
      sio = StringIO.new(response.body)
      gz = Zlib::GzipReader.new(sio)
      gz.read()
    else
      response.body
    end

    JSON.parse(response_body.force_encoding("UTF-8"))
  rescue => e
    puts "parse json response error!, #{e}"
    nil
  end
end

# execute and print response
# puts ApiPtxData.new.get_tra_station

def get_keyowrds_query(query_columns, keywords)
  if query_columns.is_a?(Array) && keywords.is_a?(Array)
    add_count = 0
    query_string = ""
  
    keywords.map do |keyword|
      query_columns.map do |query_column|
        if add_count == 0
          query_string += "contains(#{query_column}, '#{keyword}')"
        else
          query_string += " or contains(#{query_column}, '#{keyword}')"
        end
        add_count+=1
      end  
    end
    query_string
  else
    return nil
  end
end