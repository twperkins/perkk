class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.float :rating
      t.user :references
      t.perk :references

      t.timestamps
    end
  end
end
