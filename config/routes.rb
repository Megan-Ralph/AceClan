Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pages#index'
  devise_for :users, controllers: {sessions: "sessions"}

  resources :approvals
  resources :games

  resource :user, only: [:edit, :index] do
    collection do
      patch 'update_user'
    end
  end

  get "/pages/:page" => "pages#show"
end
