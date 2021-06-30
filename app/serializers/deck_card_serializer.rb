class DeckCardSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  
  attributes :id, :deck_id,:card_quantity,:sideboard,:card_id,:name, :mana_cost,:cmc, :rarity, :text, :flavor, :artist, :power, :toughness, :loyalty, :multiverse_id, :img_url

end

