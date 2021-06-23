class DeckCardSerializer < ActiveModel::Serializer
  attributes :id, :deck_id, :belongs_to, :card_quantity, :sideboard, :default
end
