Rails.application.routes.draw do
  devise_for :drivers
  devise_for :sponsors
  devise_for :admins
  root "homes#index"
  get 'homes/index'
  get 'homes/about'
end
