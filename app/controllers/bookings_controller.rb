class BookingsController < ApplicationController
  before_action :set_course, only: [:new, :create]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def current_index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.course = @course


    if @booking.save
      redirect_to course_booking_path(@course, @booking), notice: 'You have booked this course.'
    else
      redirect_to course_path(@course), notice: 'Could not book.'
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to course_bookings_path
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_current_index_path, notice: 'booking was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:hours, :course_id, :user_id, :review_id)
  end

end
