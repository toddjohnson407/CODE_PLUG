class ReviewsController < ApplicationController
  before_action :set_course, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    # @reviews = Review.all
    authorize @review
  end

  def index
    @reviews = Review.all
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
