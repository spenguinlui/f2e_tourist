<template>
  <div class="content">
    <div v-for="item in dataList" :key="item.ID" class="card-container">
      <Card :item="item" :type="dataType" :classType="'commonCard'"/>
    </div>
  </div>
</template>

<script>
  import Card from '../../components/card.vue';
  import { mapGetters } from 'vuex';

  export default {
    name: 'scenicspots-list',
    data () {
      return {
      }
    },
    computed: {
      ...mapGetters(['dataList', 'dataType']),
    },
    methods: {
    },
    components: {
      Card
    }
  }
</script>


<!--
textData: [
    {
      ID: "C1_379000000A_000278",
      Name: "新北市立十三行博物館",
      DescriptionDetail: "十三行博物館是臺灣第一個考古博物館，當初是為了保護國家二級古蹟的「十三行遺址」而興建；十三行文化屬於北臺灣地區的鐵器時代，時間大約在距今1,800~500年前，是目前臺灣唯一確定擁有煉鐵技術的史前居民。十三行博物館設有遺址出土各項重要文物常設展、特展廳、考古學習體驗室，詳細介紹了有關十三行文化、圓山文化等臺灣過往的遺跡與背景。一千多年前，淡水河左岸的居民住的是干欄屋，用的是人面陶罐，日常飲食則是取自大海裡的魚蝦貝類。他們的生活方式不是今日的我們能夠想像，但是從十三行博物館則可窺知一二。 1955年，一架空軍飛機行經八里上空，因為飛機上的羅盤出現磁力異常的反應，因而發現了十三行遺址。接著地質學家、考古學家前來探勘，發現了這裡是史前遺址，也成立了這座考古博物館。博物館以饒富趣味的方式，詳細介紹了由遺址所發現的十三行文化，讓我們知道十三行人在千年以前過的是什麼的生活；同時還不定期舉辦特展，有時介紹淡水河發展的歷史軌跡，有時也會有富含科學教育意味的考古探索，無論是哪一種，博物館都儘量設計得輕鬆有趣，讓遊客在娛樂之餘，也能吸收到豐富的知識，同時還能啟發孩子對歷史的興趣。經歷了館內豐足充實的心靈饗宴之後，也別忘了給自己來些味覺上的感官享受，「十三行ㄟ咖啡」提供了香醇好喝的咖啡及絕佳的觀景視野，如果不想待在室內，博物館頂的「鯨背沙丘」，也能讓你觀海、賞夕陽、還可以遠眺對岸漁人碼頭的點點漁火，感覺很不錯喔！",
      Phone: "886-2-26191313",
      ZipCode: "249",
      Picture: {
          "PictureUrl1": "https://www.travel.taipei/image/1060",
          "PictureDescription1": "新北市立十三行博物館"
      },
      Position: {
          "PositionLon": 121.40486145019531,
          "PositionLat": 25.156869888305664,
          "GeoHash": "wsqr4esm6"
      },
      Class2: "遊憩類",
      Class3: "其他",
      Level: "非古蹟",
      WebsiteUrl: "http://www.sshm.ntpc.gov.tw/",
      ParkingPosition: {},
      City: "新北市",
      SrcUpdateTime: "2021-11-10T01:15:37+08:00",
      UpdateTime: "2021-11-10T01:40:14+08:00"
  },
  {
    ID: "C1_382000000A_109607",
    Name: "新北市立十三行博物館",
    DescriptionDetail: "位在八里的十三行博物館是臺灣第一個考古博物館，當初是為了保護國家二級古蹟的「十三行遺址」而興建，1955年，一架空軍飛機行經八里上空，因為飛機上的羅盤出現磁力異常的反應，因而發現了十三行遺址。接著地質學家、考古學家前來探勘，發現了這裡是史前遺址，也成立了這座考古博物館。十三行文化屬於北臺灣地區的鐵器時代，是目前臺灣唯一確定擁有煉鐵技術的史前居民。不但是北臺灣唯一的考古博物館，也是新北市第一所榮獲環境教育場域認證的博物館。全館藉由三組不同型態的建築群，架構成完整的概念，分別表達山與海、過去與現在的意象，並以真實透心的材質，如清水混凝土、砂岩及老化的金屬板等，構築成完整的理念。博物館設有遺址出土各項重要文物常設展、特展廳、考古學習體驗室，詳細介紹了有關十三行文化、圓山文化等臺灣過往的遺跡與背景。一千多年前，淡水河左岸的居民住的是干欄屋，用的是人面陶罐，相傳以前食人族原住民都會有出草的活動，到後面就漸漸改用這類的祭祀物品來代替。日常飲食則是取自大海裡的魚蝦貝類。他們的生活方式不是今日的我們能夠想像，但是從十三行博物館則可窺知一二。博物館豐富有趣的方式，詳細介紹遺址所發現的十三行文化，讓我們知道十三行人在千年以前過的是什麼的生活；同時還不定期舉辦特展，有時介紹淡水河發展的歷史軌跡，有時也會有富含科學教育意味的考古探索，讓遊客在娛樂之餘，也能吸收到豐富的知識，同時還能啟發孩子對歷史的興趣。",
    Description: "北臺灣唯一考古博物館，寓教於樂",
    Phone: "886-2-26191313",
    Address: "新北市249八里區博物館路200號",
    ZipCode: "249",
    TravelInfo: "1.捷運淡水站 → 渡船 → 左岸渡船頭站紅13路(紅22路、704路公車，仁愛路口下)接駁公車 → 十三行博物館2.捷運淡水站 → 渡船 → 騎自行車約4公里 → 十三行博物館3.捷運關渡站 → 紅13路(紅22路仁愛路口下)接駁公車 → 十三行博物館4.捷運徐匯中學站→927路公車→蘆洲→永安大橋→台64線→八里→仁愛路口站下車→十三行博物館5.捷運蘆洲站→704路公車→成...",
    OpenTime: "週一至週五 09:30－17:00週六至週日 09:30－17:00 (以官方公告為主)",
    Picture: {
        "PictureUrl1": "https://newtaipei.travel/content/images/attractions/25611/640x480_attractions-image-rqtpj67poum3hdvapmccqg.jpg",
        "PictureDescription1": "博物館外觀"
    },
    Position: {
        "PositionLon": 121.40484619140625,
        "PositionLat": 25.156879425048828,
        "GeoHash": "wsqr4esm3"
    },
    ParkingPosition: {},
    Remarks: "【免門票對象】新北市市民、65歲以上年長者（限本國籍）、未滿12歲之孩童、國內各級學校之學生、身心障礙者及其陪伴者、55歲以上之原住民、持有低收入戶證明、持有志願服務榮譽卡之志工、...",
    City: "新北市",
    SrcUpdateTime: "2021-11-10T01:15:37+08:00",
    UpdateTime: "2021-11-10T01:40:14+08:00"
  }],
  dataList: [
    {ID: "0", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
    {ID: "1", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
    {ID: "2", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
    {ID: "3", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
    {ID: "4", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }},
    {ID: "5", Name: "", Picture: { PictureUrl1: "", PictureDescription1: "" }}
  ]
-->