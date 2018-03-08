Rails.application.routes.draw do
  devise_for :admins
  resources :slides
  resources :presentations
  get "/slide_data/:id", to: "slides#slide_data"
  get "/presentations/:id/intro_slide", to: "presentations#presentation_intro", as: "intro_slide"
  get "/presentations/:id/first_slide", to: "presentations#first_presentation_slide", as: "first_presentation_slide"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "presentations#index"
end
