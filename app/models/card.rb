class Card < ApplicationRecord
  belongs_to :deck

  validates :name, presence: true
  
end
