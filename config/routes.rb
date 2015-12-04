Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'barbecues#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
 
  resources :barbecues, only: [ :index, :show, :new, :create ] do
    resources :users, only: [ :new, :create ]
  end

  get '/api/barbecues/:id' => 'barbecues#json'
  post '/api/barbecues/:id/join' => 'barbecues#join'

end




 

