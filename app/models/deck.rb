class Deck < ApplicationRecord
  belongs_to :user
  has_many :deck_cards
  has_many :cards, through: :deck_cards
  
  
  validates :name, presence: true


  accepts_nested_attributes_for :deck_cards    
  # accepts_nested_attributes_for :cards

  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

end
