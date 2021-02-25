class SetDefaultValueForRatingInStarships < ActiveRecord::Migration[6.1]
  def change
    change_column :starships, :rating, :integer, default: 0
  end
end
