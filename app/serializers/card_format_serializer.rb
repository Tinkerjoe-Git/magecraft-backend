class CardFormatSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :legality
  has_one :card
  has_one :format
end
