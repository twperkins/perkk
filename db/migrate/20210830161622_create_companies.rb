class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :total_token
      t.integer :head_count
      t.string :logo_pic
      t.date :subscription_start
      t.date :subscription_end
      t.boolean :renewed, default: true

      t.timestamps
    end
  end
end
