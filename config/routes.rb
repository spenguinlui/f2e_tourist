Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 首頁-用來放 vue 實體，畫面交給 vue 處理
  root 'home#index'

  # 前台皆由 vue 呼叫 api
  namespace :api do
    namespace :v1 do
      get 'citys' => 'basic#town'                 # 取得所有城市鄉鎮名稱
      get 'scenicspots' => 'basic#scenicspots'    # 取得所有景點資料(含城市過濾)
      get 'activities' => 'basic#activities'      # 取得所有活動資料(含城市過濾)
      get 'restaurants' => 'basic#restaurants'    # 取得所有餐廳資料(含城市過濾)
      get 'hotels' => 'basic#hotels'              # 取得所有住宿資料(含城市過濾)
      
      get 'detail/scenicspots/:id' => 'detail#scenicspots'  # 取得單個景點詳細資料
      get 'detail/activities/:id' => 'detail#activities'    # 取得單個活動詳細資料
      get 'detail/restaurants/:id' => 'detail#restaurants'  # 取得單個餐廳詳細資料
      get 'detail/hotels/:id' => 'detail#hotels'            # 取得單個住宿詳細資料

      get 'search' => 'advanced#keyword_search'   # 關鍵字搜尋
      get 'theme' => 'advanced#theme'             # 取得 Tag 主題式資料
    end
  end
  
  # 後台管理資料 - rails erb 環境
  namespace :admin, path: ENV['ADMIN_PATH'] do
    get 'test' => 'home#index'
  end

  # 讓所有 path 都掛回首頁，再交給 vue router 去轉
  get '/*/*path', to: 'home#index'
end
