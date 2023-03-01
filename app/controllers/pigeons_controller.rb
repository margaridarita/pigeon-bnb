class PigeonsController < ApplicationController
  before_action :set_pigeon, only: %i[show edit update]

  def index
    @pigeons = Pigeon.all
  end

  def show; end

  def new
    @pigeon = Pigeon.new
  end

  def create
    @pigeon = Pigeon.new(pigeon_params)
    @pigeon.user = current_user
    if @pigeon.save
      redirect_to pigeon_path(@pigeon)
      # path to the pigeon page that was just created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @pigeon.update(pigeon_params)
    redirect_to pigeon_path(@pigeon.id)
  end

  private

  def set_pigeon
    @pigeon = Pigeon.find(params[:id])
  end

  def pigeon_params
    params.require(:pigeon).permit(:name, :description, :available, :price_per_day, :photo)
  end

end
