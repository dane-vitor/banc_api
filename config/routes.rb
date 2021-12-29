Rails.application.routes.draw do
  resources :transactions
  resources :customers
  post '/transactions/deposits', to: 'transactions#deposit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
