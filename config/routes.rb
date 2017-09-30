Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :colors
  resources :products
  resources :variants
  resources :categories
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'home#home_page'

  get '/toggleLike/:product_id/' => 'review#toggleLike', as: "toggleLike"
  post '/add_review/' => 'products#add_review', as: "add_review"

  post '/amazon_product/' => 'products#amazon_product'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
