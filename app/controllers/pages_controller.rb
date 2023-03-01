class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
  end

  def my_pigeons
    @user = current_user
  end

  def my_bookings
    @user = current_user
  end
end
