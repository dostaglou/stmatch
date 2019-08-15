class BookingsController < ApplicationController

    before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking)
    # below is all associated bookings
    @userbookings = @bookings.where(user: current_user)
    # below is only the above's bookings as student if any
    @student_bookings = []
    # below is only the above's bookings as teacher if any
    @teacher_bookings = []
    @userbookings.each do |booking|
      if booking.course.user_id == current_user.id
        @teacher_bookings << booking
      else
        @student_bookings << booking
      end
    end
  end

  def show
    authorize @booking
    @course = Course.find(@booking.course_id)
    authorize @course
  end

  def new
    @course = Course.find(params[:course_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(set_booking_params)
    authorize @booking
    @booking.course_id = params[:course_id]
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(set_booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_booking_params
    params.require(:booking).permit(:date, :location, :status)
  end
end
