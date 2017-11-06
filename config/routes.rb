Rails.application.routes.draw do
  resources :courses

  resources :units do
    resources :reviews
  end

  namespace :admin do
    resources :reviews
  end
end
