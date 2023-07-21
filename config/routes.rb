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
  get 'homes/index'
  get 'homes/about'

  resources :drivers, only:[:index, :show, :edit, :update] do
    member do
      get :dashboard
    end
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

  resources :ads, only:[:index, :show]
end
