class DeckCardSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :deck_id, :card_id, :quantity
end
