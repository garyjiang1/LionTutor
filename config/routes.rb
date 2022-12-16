Rails.application.routes.draw do
  devise_for :users

  #resources :meetings
  resources :tutors
  resources :tutors do
    resources :reviews, except: [:show, :index]
    resources :meetings
  end

  get 'home/about'
  # get 'calendar/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
