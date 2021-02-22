class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
  end
  def new
    @starship = Starship.find("id")
  end
end
