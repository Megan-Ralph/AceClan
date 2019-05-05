Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'pages#index'
  devise_for :users

  get "/pages/:page" => "pages#show"
end
