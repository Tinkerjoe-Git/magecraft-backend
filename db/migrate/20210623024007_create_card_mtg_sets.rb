class CreateCardMtgSets < ActiveRecord::Migration[6.1]
  def change
    create_table :card_mtg_sets do |t|
      t.belongs_to :card, null: false, foreign_key: true
      t.belongs_to :mtg_set, null: false, foreign_key: true

      t.timestamps
    end
  end
end
