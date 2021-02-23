class StarshipsController < ApplicationController
skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @starships = Starship.all
  end

  def show
    @starship = Starship.find(params[:id])
  end

  def new
    @starship = Starship.new
  end

  def create
    @starship = Starship.new(starship_params.merge(user_id: current_user.id))
    if @starship.save!
      redirect_to @starship
    else
      render :new
    end
  end

  private

  def starship_params
    params.require(:starship).permit(:name, :model, :manufacturer, :cost, :length, :max_speed, :crew, :passengers, :cargo_capacity, :starship_class, :location, :photo)
  end
end
