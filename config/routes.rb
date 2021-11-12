Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 首頁-用來放 vue 實體，畫面交給 vue 處理
  root 'home#index'
  # 讓所有 path 都掛回首頁，再交給 vue router 去轉
  get '/#/*path', to: 'home#index'

  # 前台皆由 vue 呼叫 api
  namespace :api do
    namespace :v1 do
      get 'citys' => 'basic#town'                 # 取得所有城市鄉鎮名稱
      get 'scenic_spots' => 'basic#scenic_spots'  # 取得所有景點資料
      get 'activities' => 'basic#activities'      # 取得所有活動資料
      get 'restaurants' => 'basic#restaurants'    # 取得所有餐廳資料
      get 'hotels' => 'basic#hotels'              # 取得所有住宿資料
      get 'detail/scenic_spots/:id' => 'detail#scenic_spots'
      get 'detail/activities/:id' => 'detail#activities'
      get 'detail/restaurants/:id' => 'detail#restaurants'
      get 'detail/hotels/:id' => 'detail#hotels'
      get 'search' => 'advanced#keyword_search'
    end
  end

  # 後台管理資料 - rails erb 環境
  namespace :admin, path: ENV['ADMIN_PATH'] do
    get 'test' => 'home#index'
  end
end
