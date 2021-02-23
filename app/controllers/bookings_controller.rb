class BookingsController < ApplicationController
  def index
    @user = current_user
    @bookings = @user.bookings
  end
  
  def new
    find_starship
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params.merge(user_id: current_user.id))
    find_starship
    @booking.starship = @starship
    if @booking.save
      redirect_to starship_path(@starship)
    else
      render :new
    end
  end

  private

  def find_starship
    @starship = Starship.find(params[:starship_id])
  end

  def booking_params
    params.require(:booking).permit(:booking_start_date, :booking_end_date)
  end
end
