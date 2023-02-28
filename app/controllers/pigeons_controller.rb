class PigeonsController < ApplicationController
  before_action :set_pigeon, only: [:show]
  before_action :set_user, only: [:new, :create]

  def index
    @pigeons = Pigeon.all
  end

  def show
    @pigeon = Pigeon.find(params[:id])
  end

  def new
    @pigeon = Pigeon.new
  end

  def create
    @pigeon = Pigeon.new(pigeon_params)
    @pigeon.user = @user
    if @pigeon.save
      redirect_to pigeon_path(@list)
      # path to the pigeon page that was just created
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_pigeon
    @pigeon = Pigeon.find(params[:id])
  end

  def pigeon_params
    params.require(:pigeon).permit(:name, :description, :available, :price_per_day)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
