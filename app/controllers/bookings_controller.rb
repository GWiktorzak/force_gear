class BookingsController < ApplicationController
  before_action :set_starship, only: %i[new create]

  def index
    @user = current_user
    @bookings = @user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params.merge(user_id: current_user.id, price: calculate_price))
    @booking.starship = @starship
    if @booking.save
      redirect_to bookings_path, notice: "Booking for #{@booking.starship.name} confirmed!"
    else
      render "starships/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path, notice: "Booking for #{@booking.starship.name} was deleted"
  end

  private

  def set_starship
    @starship = Starship.find(params[:starship_id])
  end

  def calculate_price
    end_date = Date.new(params["booking"]["booking_end_date"].to_i)
    start_date = Date.new(params["booking"]["booking_start_date"].to_i)
    days = ((end_date - start_date) + 1).to_i
    @starship.cost * days
  end

  def booking_params
    params.require(:booking).permit(:booking_start_date, :booking_end_date)
  end
end
