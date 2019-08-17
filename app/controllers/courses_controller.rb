class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = policy_scope(Course)
    if params[:query].present?
      @courses = policy_scope(Course).joins(:user).global_search(params[:query])

    end

    if params[:search]
      @filter = params[:search]["level"].concat(params[:search]["duration"]).flatten.reject(&:blank?)
      @courses = @filter.empty? ? Course.all : Course.all.tagged_with(@filter, any: true)
    end

    if user_signed_in?
      @user = current_user
      @your_courses = current_user.courses
      @courses_from_others = @courses.where.not(user: current_user)
    end
  end

  def show
    @course = Course.find(params[:id])
    @booking = Booking.new
    # authorize @booking
    authorize @course
    @course_geo = Course.geocoded
    @courses_taken = []
    if user_signed_in?
      current_user.bookings.each do |booking|
        @courses_taken << booking.course.name
      end
    end
    @marker =
      [{
        lat: @course.latitude,
        lng: @course.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { course: @course }),
        image_url: helpers.asset_url('marker.png')
      }]
    @review = Review.new
    authorize @review
  end

  def new
    @course = Course.new
    authorize @course # this goes here because it needs to seed the course
    @course_geo = Course.geocoded
  end

  def create
    @course = Course.new(set_course_params)
    authorize @course
    @course.user = current_user
    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def edit
    authorize @course
  end

  def update
    authorize @course
    if @course.update(set_course_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    authorize @course
    @course.destroy
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_course_params
    params.require(:course).permit( :name,
                                    :level_list,
                                    :duration_list,
                                    :description,
                                    :location,
                                    :price,
                                    :photo
                                  )
  end
end
