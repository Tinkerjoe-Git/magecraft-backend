class CreateDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :creator
      t.belongs_to :format, index: true
      t.belongs_to :user, index: true
      t.integer :mainboard
      t.integer :sideboard
      t.integer :total_cards

      t.timestamps
    end
  end
end
