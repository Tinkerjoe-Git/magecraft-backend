class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :format
  has_many :deck_cards, dependent: :delete_all
  has_many :cards, through: :deck_cards

  before_save :card_quantity_calculator


  def card_quantity_calculator
    self.mainboard = DeckCard.where(deck_id: self.id, sideboard: false).sum(:card_quantity)
    self.sideboard = DeckCard.where(deck_id: self.id, sideboard: true).sum(:card_quantity)
    self.total_cards = self.mainboard + self.sideboard
  end

  def self.by_id(deck_id)
    Deck.joins(:format, :user).where(id: deck_id).select('decks.*, formats.name AS format_name, users.name AS user_name').references(:format, :user)[0]
  end


  def self.default_search(user_id = nil)
    if user_id
      Deck.order(created_at: :desc).joins(:format, :user).where("decks.user_id <> ?").select('decks.*, formats.name AS format_name, users.name AS user_name').references(:format, :user).limit(50)
    else
      Deck.order(created_at: :desc).joins(:format, :user).select('decks.*, formats.name AS format_name, users.name AS user_name').references(:format, :user).limit(50)
    end
  end
end
