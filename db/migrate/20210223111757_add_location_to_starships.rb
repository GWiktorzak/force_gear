class AddLocationToStarships < ActiveRecord::Migration[6.1]
  def change
    add_column :starships, :location, :string
  end
end
