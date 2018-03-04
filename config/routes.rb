Rails.application.routes.draw do
  resources :slides
  get "/slide_data/:id", to: "slides#slide_data"
  resources :presentations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "presentations#index"
end
