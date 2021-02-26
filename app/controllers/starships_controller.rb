class StarshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_starship, only: %i[show edit update destroy]

  def index
    @starships = Starship.all

    @markers = @starships.geocoded.map do |starship|
      {
        lat: starship.latitude,
        lng: starship.longitude,
        image_url: helpers.asset_url('Vector.png')
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @starship = Starship.new
  end

  def edit
  end

  def update
    @starship.update(starship_params)
    redirect_to starship_path(@starship)
  end

  def create
    @starship = Starship.new(starship_params.merge(user_id: current_user.id))
    if @starship.save!
      redirect_to @starship
    else
      render :new
    end
  end

  def destroy
    @starship.destroy

    redirect_to root_path
  end

  private

  def set_starship
    @starship = Starship.find(params[:id])
  end

  def starship_params
    params.require(:starship).permit(:name, :cost, :location, :description, :photo)
  end
end
