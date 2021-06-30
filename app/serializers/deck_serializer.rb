class DeckSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  attributes :id, :name, :creator, :total_cards, :mainboard, :sideboard, :created_at, :updated_at, :user_name, :user_id, :format_name


  attribute :cards do |object|
    DeckCard.get_deck_cards_by_deck(object.id).as_json
  end


end