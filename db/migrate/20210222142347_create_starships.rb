class CreateStarships < ActiveRecord::Migration[6.1]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :model
      t.string :manufacturer
      t.string :cost
      t.string :length
      t.string :max_speed
      t.string :crew
      t.string :passengers
      t.string :cargo_capacity
      t.string :starship_class

      t.timestamps
    end
  end
end
