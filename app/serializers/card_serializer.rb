class CardSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :name, :text, :power, :toughness, :cmc, :rarity, :card_type, :artist, :colors, :set, :flavor, :mana_cost, :image_url, :loyalty, :collection_id
end
