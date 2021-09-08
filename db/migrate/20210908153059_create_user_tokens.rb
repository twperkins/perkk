class CreateUserTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.references :token, null: false, foreign_key: true

      t.timestamps
    end
  end
end
