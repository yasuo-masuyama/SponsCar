Rails.application.routes.draw do
  devise_for :admins, controllers:{ 
    registrations: 'admins/registrations',
    sessions: 'admins/sessions' 
  }
  devise_scope :admin do
    post 'admin/guest_sign_in', to: 'admins/sessions#guest_sign_in'
  end

  devise_for :drivers, controllers:{ 
    registrations: 'drivers/registrations',
    sessions: 'drivers/sessions' 
  }
  devise_scope :driver do
    post 'driver/guest_sign_in', to: 'drivers/sessions#guest_sign_in'
  end

  devise_for :sponsors, controllers:{ 
    registrations: 'sponsors/registrations',
    sessions: 'sponsors/sessions' }
  devise_scope :sponsor do
    post 'sponsor/guest_sign_in', to: 'sponsors/sessions#guest_sign_in'
  end

  root 'homes#index'
  resources :homes, only: %i[ index ] do
    collection do
      get :about
    end
  end

  resources :drivers, only: %i[ index show edit update ] do
    member do
      get :dashboard
      get :followings, :followers
    end
    resources :car_infos, only: %i[ index create edit update destroy ]
    resources :transfer_infos, only: %i[ index create edit update destroy ]
  end

  resources :sponsors, only: %i[ index show edit update ] do
    member do
      get :dashboard
      get :followings, :followers
    end
    scope module: :sponsors do
      resources :advertisements
    end
  end

  resources :under_deals, only: %i[ index show create edit update ] do
    member do
      get :show_driver
    end
    resources :deal_messages, only: %i[ create ]
  end
  scope module: :under_deals do
      get :coming_soon
	end

  resources :infos

  resources :admins, only: %i[ index ]
    namespace :admins do
      resources :sponsors, only: %i[ index show update ]
      resources :drivers, only: %i[ index show update ]
      resources :genres, only: %i[ index create edit update destroy ]
      resources :contacts, only: %i[ index show ]
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

  resources :advertisements, only: %i[ index show ] do
    resources :chats, only: %i[ index create ]
    resources :rooms, only: %i[ index show create ]
    member do
      get :genre_index
      get :favorite_index
    end
    resource :favorites, only: %i[ create destroy ]
  end

  post 'relationship_drivers/:sponsor_id', to: 'relationship_drivers#create', as:'relationship_drivers'
  delete 'relationship_drivers/:sponsor_id', to: 'relationship_drivers#destroy'
  
  post '/relationships/:driver_id',to: 'relationships#create',as:'relationships'
  delete '/relationships/:driver_id',to: 'relationships#destroy'
end
