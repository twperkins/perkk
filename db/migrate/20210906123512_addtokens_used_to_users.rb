class AddtokensUsedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tokens_used, :integer
  end
end
