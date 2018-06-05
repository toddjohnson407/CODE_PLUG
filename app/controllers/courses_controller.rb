class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def current_index
    @courses = policy_scope(Course).order(created_at: :desc)
  end

  def index
    @courses = policy_scope(Course).order(created_at: :desc)
  end

  def show
      # @booking = Booking.new
      @course = Course.find(params[:id])
      # @markers = { lat: @course.latitude, lng: @course.longitude }
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @subject = Subject.find_by(category: params[:course][:subject])
    @course = Course.new(course_params)
    @course.subject = @subject
    @course.user = current_user

    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to current_index_path, notice: 'course was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  def set_course
    @course = Course.find(params[:id])
    authorize @course
  end

  def course_params
    params.require(:course).permit(:title, :user_id, :price, :description, :address)
  end
end
