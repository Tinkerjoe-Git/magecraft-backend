class CardMtgSet < ApplicationRecord
  belongs_to :card, index: true
  belongs_to :mtg_set, index: true
end
