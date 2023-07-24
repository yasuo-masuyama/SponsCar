Rails.application.routes.draw do
  devise_for :admins, controllers:{ 
    registrations: 'admins/registrations',
    sessions: 'admins/sessions' 
  }

  devise_for :drivers, controllers:{ 
    registrations: 'drivers/registrations',
    sessions: 'drivers/sessions' 
  }
  devise_scope :driver do
    post 'driver/guest_sign_in', to: 'drivers/sessions#new_guest'
  end

  devise_for :sponsors, controllers:{ 
    registrations: 'sponsors/registrations',
    sessions: 'sponsors/sessions' }
  devise_scope :sponsor do
    post 'sponsor/guest_sign_in', to: 'sponsor/sessions#guest_sign_in'
  end

  root 'homes#index'
  resources :homes, only: %i[ index ] do
    collection do
      get :about
    end
  end

  resources :drivers, only:[:index, :show, :edit, :update] do
    member do
      get :dashboard
    end
    resources :car_infos, only: %i[ index create edit update destroy ]
  end

  resources :sponsors, only:[:index, :show, :edit, :update] do
    member do
      get :dashboard
    end
  end

  resources :under_deals, only:[:index, :show, :create, :edit,:update]do
    member do
      get :show_driver
    end
      resources :deal_messages, only:[:create]
  end

  resources :advertisements, only:[:index, :show]

  resources :infos

  resources :admins, only:[:index]
    namespace :admins do
      resources :sponsors, only: [:index, :show, :update]
      resources :drivers, only: [:index, :show, :update]
      resources :genres, only: [:index, :create, :edit, :update, :destroy]
      resources :contacts, only: [:index,:show]
    end

  resources :contacts, only: %i[ index new create show update ] do
    collection do
      post :confirm
    end
  end
  scope module: :contacts do
    get :new_inquiry
    get :working_inquiry
    get :past_inquiry
  end
end
