class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :starship, null: false, foreign_key: true
      t.date :booking_start_date
      t.date :booking_end_date

      t.timestamps
    end
  end
end
