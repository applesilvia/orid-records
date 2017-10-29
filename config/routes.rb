Rails.application.routes.draw do
  devise_for :users

  resources :index, only: [:index]

  resources :orids do
    resources :comments
  end

  namespace :admin do
    resources :orids
    resources :users
  end

  namespace :account do
    resources :orids do
      member do
        get :markdown
      end
    end
  end

  root 'welcome#index'
end
