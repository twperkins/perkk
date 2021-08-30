class CreateUserPerks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_perks do |t|
      t.boolean :redeemed
      t.boolean :favourited
      t.user :references
      t.perk :references

      t.timestamps
    end
  end
end
