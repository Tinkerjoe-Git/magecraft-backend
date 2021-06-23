class CreateMtgSets < ActiveRecord::Migration[6.1]
  def change
    create_table :mtg_sets do |t|
      t.string :name
      t.string :code
      t.date :release_date

      t.timestamps
    end
  end
end
