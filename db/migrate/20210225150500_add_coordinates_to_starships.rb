class AddCoordinatesToStarships < ActiveRecord::Migration[6.1]
  def change
    add_column :starships, :latitude, :float
    add_column :starships, :longitude, :float
  end
end
