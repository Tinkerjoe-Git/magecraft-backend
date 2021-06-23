class MtgSet < ApplicationRecord
  has_many :cards
  has_and_belongs_to_many :cards
  validates :name, uniqueness: true, presence: true
end
