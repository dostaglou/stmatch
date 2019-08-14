class CoursesController < ApplicationController
  before_action :set_course

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @couse = Course.new(set_course_params)
    @course.user = @user.id
    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_course_params
    params.require(:course).permit(:name, :level, :duration, :description)
  end
end
