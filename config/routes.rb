Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => :registrations }
  root 'exchanges#index'

  resources :exchanges do
    resources :giftings
  end

  resources :groups
  resources :memberships

  resources :conversations do
    resources :messages
  end

  resources :members, only: [:index, :create]

end
