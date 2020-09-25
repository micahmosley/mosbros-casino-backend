Rails.application.routes.draw do
  resources :decks
  resources :users
  resources :games
  resources :dealers
  resources :cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
