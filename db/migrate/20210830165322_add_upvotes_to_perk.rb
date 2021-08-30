class AddUpvotesToPerk < ActiveRecord::Migration[6.0]
  def change
    add_column :perks, :upvotes, :integer
  end
end
