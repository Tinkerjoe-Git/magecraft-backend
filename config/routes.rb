Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: :registrations,
  sessions: :sessions
  }
  patch '/decks/:deck_id/deck_cards', to: 'deck_cards#update'
  delete '/decks/:deck_id/deck_cards', to: 'deck_cards#destroy'
  get '/cards', to: 'cards#index'
  get '/cards/search', to: 'cards#search'
  get '/decks/search', to: 'decks#search'
  post '/signup', to: 'users#create'
  post '/login', to: 'auths#create'
  get '/current_user', to: 'auths#show'

  
  


  resources :users
  resources :card_formats
  resources :card_mtg_sets
  resources :mtg_sets
  resources :formats
  resources :deck_cards
  resources :deck_cards do
  end
  resources :decks do
  end

 

end
