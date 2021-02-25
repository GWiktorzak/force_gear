class RemoveUnnecessaryColumnsFromStarships < ActiveRecord::Migration[6.1]
  def change
    remove_column :starships, :model
    remove_column :starships, :manufacturer
    remove_column :starships, :length
    remove_column :starships, :max_speed
    remove_column :starships, :crew
    remove_column :starships, :passengers
    remove_column :starships, :cargo_capacity
    remove_column :starships, :starship_class
  end
end
