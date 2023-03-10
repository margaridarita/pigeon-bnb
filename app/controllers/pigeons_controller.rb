class PigeonsController < ApplicationController
  before_action :set_pigeon, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @pigeons = Pigeon.where(category: params[:query])
    else
      @pigeons = Pigeon.all
    end

    @markers = @pigeons.geocoded.map do |pigeon| {
        lat: pigeon.latitude,
        lng: pigeon.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {pigeon: pigeon}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

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

  def map
    @action_name = "map"
  end

  def update
    @pigeon.update(pigeon_params)
    redirect_to pigeon_path(@pigeon.id)
  end

  def destroy
    @pigeon.destroy
    redirect_to my_pigeons_path, status: :see_other
  end

  private

  def set_pigeon
    @pigeon = Pigeon.find(params[:id])
  end

  def pigeon_params
    params.require(:pigeon).permit(:name, :description, :available, :price_per_day, :category, :address, photos: [])
  end
end
