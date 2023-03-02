class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user, only: %i[dashboard my_pigeons my_bookings]

  def home; end

  def dashboard
    @sum = 0
    @user.pigeons.each do |pigeon|
      b = Booking.where(pigeon_id: pigeon.id) if Booking.where(pigeon_id: pigeon.id).exists?
      b.each do |bt|
        @sum += bt.total_price
      end
    end
    #@user.bookings.sort_by(:start_date)
  end

  def my_pigeons; end

  def my_bookings; end

  private

  def set_user
    @user = current_user
  end
end
