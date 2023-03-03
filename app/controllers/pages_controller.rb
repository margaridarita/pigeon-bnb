class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user, only: %i[dashboard my_pigeons my_bookings my_account]

  def home
    @action_name = "home"
  end

  def dashboard
    @sum = 0
    @points = 0

    if @user.bookings.exists?
      @user.bookings.each do |b|
        @points += b.total_price
      end
    end

    if @user.pigeons.exists?
      @user.pigeons.each do |pigeon|
        b = Booking.where(pigeon_id: pigeon.id)
        b.each do |bt|
          @sum += bt.total_price
        end
      end
    end


  end

  def my_account; end

  def my_pigeons; end

  def my_bookings; end

  private

  def set_user
    @user = current_user
  end
end
