class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :format
  has_many :deck_cards, dependent: :delete_all
  has_many :cards, through: :deck_cards

  before_save :card_quantity_calculator


  def card_quantity_calculator
    self.mainboard = DeckCard.where(deck_id: self.id, sideboard: false).sum(:card_quantity)
    self.sideboard = DeckCard.where(deck_id: self.id, sideboard: true).sum(:card_quantity)
    self.total_cards = self.mainboard + self.total_sideboard
  end
end
