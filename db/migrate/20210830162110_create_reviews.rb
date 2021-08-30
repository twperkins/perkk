class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.float :rating
      t.references :user
      t.references :perk

      t.timestamps
    end
  end
end
