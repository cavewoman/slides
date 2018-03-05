Rails.application.routes.draw do
  devise_for :admins
  resources :slides
  resources :presentations
  get "/slide_data/:id", to: "slides#slide_data"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "presentations#index"
end
