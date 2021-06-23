class CardFormatSerializer < ActiveModel::Serializer
  attributes :id, :legality
  has_one :card
  has_one :format
end
