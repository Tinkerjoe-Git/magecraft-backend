class DeckSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :name, :user_id
end
