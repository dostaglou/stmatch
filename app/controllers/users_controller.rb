class UsersController < ApplicationController
  def show
    @user = current_user
    @reviews = @user.reviews
    @courses = @user.courses
    authorize @user
    authorize @reviews
    authorize @courses
  end
  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    if @user.update(set_booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  private
  def set_booking_params
    params.require(:user).permit(:photo)
  end
end
