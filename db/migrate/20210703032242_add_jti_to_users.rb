class AddJtiToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :jti, false
    add_index :users, :jti, unique: true
  end
end
