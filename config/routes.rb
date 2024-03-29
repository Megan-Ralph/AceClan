Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pages#index'
  devise_for :users, controllers: {sessions: "sessions"}

  resources :approvals
  resources :games
  resources :tabs
  resources :subtabs
  resources :job_applications
  resources :job_listings

  resource :user do
    collection do
      patch 'update_user'
      patch 'update_user_groups'
    end
  end

  get "/pages/:page" => "pages#show"
end
