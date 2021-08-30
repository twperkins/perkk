class CreateUserPerks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_perks do |t|
      t.boolean :redeemed
      t.boolean :favourited
      t.references :user
      t.references :perk

      t.timestamps
    end
  end
end
