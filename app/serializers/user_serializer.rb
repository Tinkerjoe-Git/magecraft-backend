class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  attributes :id, :name, :email

  attribute :decks do |object|
    DeckSerializer.new(Deck.joins(:format, :user).where(id: object.id).select('decks.*, formats.name AS format_name, users.name AS user_name').references(:format, :user)).serializable_hash
  end
end
