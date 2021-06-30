class UserSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name

  attribute :decks do |object|
    DeckSerializer.new(Deck.joins(:format, :user).where(user_id: object.id).select('decks.*, formats.name AS format_name, users.name AS user_name').references(:format, :user)).serializable_hash
  end
end
