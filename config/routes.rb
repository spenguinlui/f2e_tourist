Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 首頁-用來放 vue 實體，畫面交給 vue 處理
  root 'home#index'

  # 前台皆由 vue 呼叫 api
  namespace :api do
    namespace :v1 do
      get 'test' => 'home#index'
    end
  end

  # 後台管理資料 - rails erb 環境
  namespace :admin, path: ENV['ADMIN_PATH'] do
    get 'test' => 'home#index'
  end
end
