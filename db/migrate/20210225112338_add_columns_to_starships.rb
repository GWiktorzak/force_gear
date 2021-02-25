class AddColumnsToStarships < ActiveRecord::Migration[6.1]
  def change
    add_column :starships, :description, :text
    add_column :starships, :rating, :integer
  end
end
