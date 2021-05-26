class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :text
      t.integer :power
      t.integer :toughness
      t.integer :cmc
      t.string :rarity
      t.string :card_type
      t.string :artist
      t.string :colors
      t.string :set
      t.string :flavor
      t.string :mana_cost
      t.string :image_url
      t.integer :loyalty
      t.belongs_to :deck, foreign_key: true

      t.timestamps
    end
  end
end
