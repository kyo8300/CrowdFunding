Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'
  resources :projects do
    resources :rewards
    member do
      patch :submit
      get :preview
    end
  end

  resources :admins do
    member do
      patch :approve
      patch :reject
      patch :add_comment
    end
  end

  resources :users do
    member do
      get :backed
    end
  end

  resources :myprojects, only: [:index]
  resources :stories, only: [:edit, :update]
end
