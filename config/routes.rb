Rails.application.routes.draw do
  resources :deck_cards
  resources :cards
  resources :collections
  resources :deck_cards do
    resources :cards, only: [:index, :show, :new, :create]
  end
  resources :decks do
    resources :deck_cards, only: [:index, :new, :create]
  end

end
