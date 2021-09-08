class AddAmountToTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :tokens, :amount, :integer
  end
end
