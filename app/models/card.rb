class Card < ApplicationRecord
  belongs_to :collection, optional: true
  has_many :deck_cards
  has_many :decks, through: :deck_cards

  validates :name, presence: true
  

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }


  def collection_attributes=(attributes)
    if !(attributes[:name].blank?)
      self.collection = collection.find_or_create_by(attributes)
    end
  end

  
end
