class CoursesController < ApplicationController
  before_action :set_course

  def index
    @courses = Course.all
  end

  def show
  end

  def new

  end

  def create

  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_course_params
    params.require(:course).permit(:name, :level, :duration, :description)
  end

end
