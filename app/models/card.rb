class Card < ApplicationRecord
  has_many :deck_cards
  has_many :decks, through: :deck_cards
  has_many :card_formats
  has_many :formats, through: :card_formats
  validates :name, presence: true


  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }
  
end
