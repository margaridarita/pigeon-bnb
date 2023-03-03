class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_pigeon, only: %i[index new create]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pigeon = @pigeon
    @booking.user = current_user
    @booking.total_price = @booking.total_price_calc
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    @booking.total_price = @booking.total_price_calc
    @booking.save
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_pigeon
    @pigeon = Pigeon.find(params[:pigeon_id])
  end

  def booking_params
    params.require(:booking).permit(:total_price, :start_date, :end_date)
  end
end
