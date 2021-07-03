Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  

  patch '/decks/:deck_id/deck_cards', to: 'deck_cards#update'
  delete '/decks/:deck_id/deck_cards', to: 'deck_cards#destroy'
  get '/cards', to: 'cards#index'
  get '/cards/search', to: 'cards#search'
  get '/decks/search', to: 'decks#search'
  # post '/signup', to: 'sessions#create'
  # post '/login', to: 'auths#create'
  get '/current_user', to: 'current_user#index'

  
  


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
