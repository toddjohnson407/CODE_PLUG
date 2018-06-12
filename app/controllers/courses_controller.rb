class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def current_index
    @courses = policy_scope(Course).order(created_at: :desc)
  end

  def index
    # byebug
    @subjects = Subject.all
    @courses = policy_scope(Course)
    # @courses = policy_scope(Course).limit(1)
    @courses = @courses.where.not(latitude: nil, longitude: nil)

    if params[:subject_id]
      @courses = @courses.where(subject_id: params[:subject_id])
    end


# ["0-20€", 1], ["21-50€", 2], ["51€<", 3] PRICE
# ["0-5km", 1], ["6-10km", 2], ["10km<", 3 DISTANCE

    if params[:price]
      if params[:price] == "1"
        @courses = @courses.where("price > ? AND price < ?", 0, 20)
      elsif params[:price] == "2"
        @courses = @courses.where("price > ? AND price < ?", 21, 50)
      elsif params[:price] == "3"
        @courses = @courses.where("price > ?", 51)
      end
    end

    unless current_user.location.nil?
     coords = current_user.location.split("-")
     loc = []
     coords.each do |coord|
      coord = coord.to_f
      loc<< coord
     end
    end



    # DISTANCE to where?

    # if params[:distance]
    #   if params[:distance] == "1"
    #     @courses = @courses.where()
    #   elsif params[:distance] == "2"
    #     @courses = @courses.where()
    #   elsif params[:distance] == "3"
    #     @courses = @courses.where()
    #   end
    # end

    @filtered_courses = Course.near(loc, params[:distance].to_i)


    # @courses = Course.search_by_city_and_address(params[:subject])
    # @courses = policy_scope(Course).limit(3)

    @markers = @courses.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude
      }
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @course = Course.find(params[:id])
    @booking = Booking.new
      # @markers = { lat: @course.latitude, lng: @course.longitude }
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @subject = Subject.find_by(category: params[:course][:subject])
    @video = course_params[:video].split("=").last
    @course = Course.new(
      subject: @subject,
      video: @video,
      user: current_user,
      title: course_params[:title],
      price: course_params[:price],
      rate: course_params[:rate],
      description: course_params[:description],
      address: course_params[:address],
      city: course_params[:city],
      photo: course_params[:photo],
      learning: course_params[:learning],
      requirement: course_params[:requirement],
      vimeo_file: course_params[:vimeo_file],
      documents: course_params[:documents]
    )

    if @course.save
      redirect_to course_path(@course)
    else
      raise
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

    params.require(:course).permit(:video_url, :video, :vimeo_file, :title, :user_id, :price, :description, :address, :city, :photo, :documents, :requirement, :learning, :subject, :documents_cache, :photo_cache)

  end
end
