class CreateFormats < ActiveRecord::Migration[6.1]
  def change
    create_table :formats do |t|
      t.string :name

      t.timestamps
    end
  end
end
