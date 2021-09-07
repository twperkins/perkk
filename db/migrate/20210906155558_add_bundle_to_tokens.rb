class AddBundleToTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :tokens, :bundle, :string
  end
end
