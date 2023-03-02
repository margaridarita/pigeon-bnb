class ReviewsController < ApplicationController
  before_action :set_pigeon, only: %i[index new create]

  def index
    @reviews = Review.where(pigeon_id: @pigeon)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.pigeon = @pigeon
    @review.save
    redirect_to pigeon_path(@pigeon)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_pigeon
    @pigeon = Pigeon.find(params[:pigeon_id])
  end
end
