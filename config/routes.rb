Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :starships, only: %i[index show new create edit update destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
