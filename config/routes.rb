Rails.application.routes.draw do


  resources :cards

  get '/cards', to: 'cards#index'

  
  resources :deck_cards do
  end
  resources :decks do
  end

  post '/decks', to: "decks#create"

end
