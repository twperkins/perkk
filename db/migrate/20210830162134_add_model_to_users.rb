class AddModelToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :model, :boolean, default: false
  end
end
