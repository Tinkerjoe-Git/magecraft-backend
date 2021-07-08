Rails.application.routes.draw do
  # get '/current_user', to: 'current_user#index'
  patch '/decks/:deck_id/deck_cards', to: 'deck_cards#update'
  delete '/decks/:deck_id/deck_cards', to: 'deck_cards#destroy'
  get '/cards', to: 'cards#index'
  get '/cards/search', to: 'cards#search'
  get '/decks/search', to: 'decks#search'
  # post '/signup', to: 'registrations#create'
  post '/login', to: 'auths#create'
  





  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
  
  


  resources :users
  resources :card_formats
  resources :card_mtg_sets
  resources :mtg_sets
  resources :formats
  resources :deck_cards
  resources :deck_cards
  resources :decks

 

end
