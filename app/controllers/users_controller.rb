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
    if @user.update(set_user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user_params
    params.require(:user).permit(:photo)
  end
end
