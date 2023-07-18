Rails.application.routes.draw do
  root "homes#index"
  get 'houmes/index'
  get 'houmes/about'
end
