Rails.application.routes.draw do


  resources :users
  post '/signup', to: 'users#create'
  post '/login', to: 'auth#create'
  get '/current_user', to: 'auth#show'

  resources :card_formats
  resources :card_mtg_sets
  resources :mtg_sets
  resources :formats
  resources :deck_cards
  patch '/decks/:deck_id/deck_cards', to: 'deck_cards#update'
  delete '/decks/:deck_id/deck_cards', to: 'deck_cards#destroy'
  resources :cards

  get '/cards', to: 'cards#index'
  get '/cards/search', to: 'cards#search'

  
  resources :deck_cards do
  end
  resources :decks do
  end

  post '/decks', to: "decks#create"

end
