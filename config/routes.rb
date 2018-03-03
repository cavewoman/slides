Rails.application.routes.draw do
  resources :slides
  get "/slide/:id", to: "slides#slide"
  resources :presentations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "presentations#index"
end
