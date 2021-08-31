class AddCoordinatesToPerks < ActiveRecord::Migration[6.0]
  def change
    add_column :perks, :latitude, :float
    add_column :perks, :longitude, :float
  end
end
