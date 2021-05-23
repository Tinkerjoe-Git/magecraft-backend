class DeckCardSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :deck_id, :card_id, :quantity
end
