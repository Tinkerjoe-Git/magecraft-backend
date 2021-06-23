class CardMtgSetSerializer < ActiveModel::Serializer
  attributes :id
  has_one :card
  has_one :mtg_set
end
