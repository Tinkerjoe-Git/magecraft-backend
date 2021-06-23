class DeckCard < ApplicationRecord
  belongs_to :deck
  belongs_to :card
  validates :card_id, :deck_id, presence: true

  accepts_nested_attributes_for :card
end
