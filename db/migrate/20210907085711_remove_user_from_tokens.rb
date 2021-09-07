class RemoveUserFromTokens < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tokens, :user, null: false, foreign_key: true
  end
end
