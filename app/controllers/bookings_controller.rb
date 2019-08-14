class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :destroy]

    def index
      @bookings = Booking.all
    end
  
    def show
      @course = Course.find(params[:course_id])
    end
  
    def new
      @course = Course.find(params[:course_id])
      @booking = Booking.new
    end
  
    def create
      @booking = Booking.new(set_booking_params)
      @booking.course_id = params[:course_id]
      @booking.user = current_user
      if @booking.save
        redirect_to bookings_path
      else
        render :new
      end
    end
  
    private
  
    def set_booking
      @booking = Booking.find(params[:id])
    end
  
    def set_booking_params
      params.require(:booking).permit(:date, :location, :status)
    end
end
