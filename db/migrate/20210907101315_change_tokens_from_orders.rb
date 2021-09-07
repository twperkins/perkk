class ChangeTokensFromOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :tokens_id, :token_id
  end
end
