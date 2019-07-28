Rails.application.routes.draw do
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
    end
  end

  resources :stories, only: [:edit, :update]
end
