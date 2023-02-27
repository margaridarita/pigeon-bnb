class PigeonsController < ApplicationController

  def index
    @pigeons = Pigeon.all
  end

  def new
    @pigeon = Pigeon.new
  end

  def create
    @pigeon = Pigeon.new(pigeon_params)
    if @pigeon.save
      redirect_to pigeon_path(@list)
      # path to the pigeon page that was just created
    else
      render :new
    end
  end

  private

  def set_pigeon
    @pigeon = Pigeon.find(params[:id])
  end

  def pigeon_params
    params.require(:pigeon).permit(:name, :description, :available, :price_per_day)
  end
end
