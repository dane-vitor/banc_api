Rails.application.routes.draw do
  resources :extracts
  resources :withdraws
  resources :deposits
  resources :transactions
  resources :customers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
