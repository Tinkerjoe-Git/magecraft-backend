class DeckCard < ApplicationRecord
  belongs_to :deck
  belongs_to :card
  validates :card_id, :deck_id, presence: true

  accepts_nested_attributes_for :card
  
  def self.get_deck_cards_by_deck(deck_id)
    DeckCard.select(
      'deck_cards.id',
      'deck_cards.card_quantity AS count',
      'deck_cards.sideboard',
      'deck_cards.card_id',
      'cards.name',
      'cards.mana_cost',
      'cards.cmc',
      'cards.rarity',
      'cards.text',
      'cards.flavor',
      'cards.artist',
      'cards.number',
      'cards.power',
      'cards.toughness',
      'cards.loyalty',
      'cards.multiverse_id',
      'cards.img_url'
    ).joins(:card).where(deck_id: deck_id).references(:card)
  end
end
