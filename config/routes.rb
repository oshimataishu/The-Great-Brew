Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'home/about' => 'public/homes#about',as: 'about'

  devise_for :users, skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#guest_sign_in'
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    get 'homes/about'
    resources :beers, only: [:index, :create, :edit, :show, :update, :destroy]
    resources :users, only: [:show, :index, :update, :edit]
  end

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy] do
      get 'followings' => 'relationships#followings', as: "followings"
      get 'followers' => 'relationships#followers', as: "followers"
    end
  end

  resources :beers, only: [:show, :index, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :beer_comments, only: [:create, :destroy]
  end

  get 'search' => 'searches#search'
end
