class AddTokensToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tokens, :integer
  end
end
