class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking)
    # below is all associated bookings
    @userbookings = @bookings.where(user: current_user)
    # below is only the above's bookings as student if any
    @teacher_pending = current_user.bookings_as_teacher.where(status: "pending")
    @teacher_confirmed = current_user.bookings_as_teacher.where(status: "confirmed")
  end

  def show
    authorize @booking
    @course = Course.find(@booking.course_id)
    authorize @course
    @course_geo = Course.geocoded
    @marker =
      [{
        lat: @course.latitude,
        lng: @course.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { course: @course }),
        image_url: helpers.asset_url('marker.png')
      }]
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
      redirect_to course_path(@booking.course)
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
