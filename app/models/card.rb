class Card < ApplicationRecord
  has_many :deck_cards
  has_many :decks, through: :deck_cards
  has_many :card_formats
  has_many :formats, through: :card_formats
  validates :name, presence: true

  scope :default_search, -> {}
  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }
  
  def mainboard_deck_card_count(deck_id)
    self.deck_cards.find_by(deck_id: deck_id, sideboard: false).card_quantity
  end

  def self.default_search
    most_recent_set = MtgSet.order(release_date: :desc).limit(1)[0].code
    Card.order(name: :asc).where(last_printing: most_recent_set).limit(50)
  end

  def self.validate_card_names(cards)
    failed_card_keys = []
    cards.each do |card|
      if !Card.find_by(name: card[:name])
        failed_card_keys.push(card[:key])
      end
    end
    failed_card_keys
  end

end
