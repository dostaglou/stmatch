class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = policy_scope(Course)
  end

  def show
    authorize @course
  end

  def new
    @course = Course.new
    authorize @course # this goes here because it needs to seed the course
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

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_course_params
    params.require(:course).permit(:name, :level, :duration, :description)
  end
end
