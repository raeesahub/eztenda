Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :businesses
  get 'offers', to: 'bids#offers'
  resources :bids,only:[:create,:index]

  resources :tenders do
    resources :bids, only: [:new, :create]
  end
end
