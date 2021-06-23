class CreateCardFormats < ActiveRecord::Migration[6.1]
  def change
    create_table :card_formats do |t|
      t.belongs_to :card, index: true, foreign_key: true
      t.belongs_to :format, index: true, foreign_key: true
      t.boolean :legality, default: true

      t.timestamps
    end
  end
end
