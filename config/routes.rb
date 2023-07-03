Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update] do
  
  end
  #resources :items, only: [:destroy] do
    
  
end
