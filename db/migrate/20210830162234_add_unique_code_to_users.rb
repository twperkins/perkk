class AddUniqueCodeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :unique_code, :string
  end
end
