class CreateDeckCards < ActiveRecord::Migration[6.1]
  def change
    create_table :deck_cards do |t|
      t.references :deck,  foreign_key: true
      t.references :card,  foreign_key: true

      t.timestamps
    end
  end
end
