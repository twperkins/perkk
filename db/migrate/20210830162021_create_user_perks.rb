class CreateUserPerks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_perks do |t|
      t.boolean :redeemed, default: false
      t.boolean :favourited, default: false
      t.references :user
      t.references :perk

      t.timestamps
    end
  end
end
