  
class CardSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  cache_options enabled: true, cache_length: 12.hours
  attributes :id, :name, :mana_cost, :cmc, :rarity, :text, :flavor, :artist, :power, :toughness, :multiverse_id, :img_url

end
