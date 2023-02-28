class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  def show
    @pigeon = Pigeon.find(params[:pigeon_id])
  end

  def new
    @booking = Booking.new
    @pigeon = Pigeon.find(params[:pigeon_id])
  end

  def create
    @pigeon = Pigeon.find(params[:pigeon_id])
    @booking = Booking.new(booking_params)
    @booking.pigeon = @pigeon
    @booking.user = current_user
    @booking.total_price = @pigeon.price_per_day * (@booking.end_date - @booking.start_date)
    if @booking.save
      redirect_to pigeon_booking_path(@pigeon, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:total_price, :start_date, :end_date, :pigeon_id, :user_id)
  end
end
