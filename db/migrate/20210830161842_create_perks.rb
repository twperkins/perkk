class CreatePerks < ActiveRecord::Migration[6.0]
  def change
    create_table :perks do |t|
      t.string :name
      t.text :description
      t.string :perk_pic
      t.string :location
      t.integer :token_cost
      t.date :start_date
      t.date :end_date
      t.string :category
      t.string :merchants

      t.timestamps
    end
  end
end
