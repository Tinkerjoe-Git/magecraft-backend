class Card < ApplicationRecord
  belongs_to :deck, optional: true

  validates :name, presence: true
  
end
