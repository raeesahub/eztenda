Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :businesses
  get 'offers', to: 'bids#offers'
  get '/contracts/:id',to: 'contracts#download'
  resources :bids,only:[:create,:index]
  resources :bids do 
    collection do 
      post :accept_bid
      post :reject_bid
    end
  end

  resources :tenders do
    resources :bids, only: [:new, :create]
  end
end
