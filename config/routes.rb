Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :users

  get "/pages/:page" => "pages#show"
end
