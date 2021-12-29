Rails.application.routes.draw do
  resources :transactions
  resources :customers
  post 'deposits', to: 'deposits#deposit'
  post 'withdraws', to: 'withdraws#withdraw'
  get 'withdraws', to: 'withdraws#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
