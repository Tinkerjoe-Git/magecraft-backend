Rails.application.routes.draw do


  resources :users
  resources :card_formats
  resources :card_mtg_sets
  resources :mtg_sets
  resources :formats
  resources :deck_cards
  resources :cards

  get '/cards', to: 'cards#index'

  
  resources :deck_cards do
  end
  resources :decks do
  end

  post '/decks', to: "decks#create"

end
