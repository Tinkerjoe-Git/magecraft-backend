class DeckCardSerializer < ActiveModel::Serializer
  attributes :id
  has_one :deck
  has_one :card
end
