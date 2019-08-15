class UsersController < ApplicationController
  def show
    @user = current_user
    @reviews = @user.reviews
    @courses = @user.courses
    authorize @user
    authorize @reviews
    authorize @courses
  end
end
