class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(set_course_params)
    @course.user = current_user
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
