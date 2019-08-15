class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]


    # def index
    #   @reviews = policy_scope(review)
    #   # below is all associated reviews
    #   @userreviews = @reviews.where(user: current_user)
    #   # below is only the above's reviews as student if any
    #   @student_reviews = []
    #   # below is only the above's reviews as teacher if any
    #   @teacher_reviews = []
    #   @userreviews.each do |review|
    #     if review.course.user_id == current_user.id
    #       @teacher_reviews << review
    #     else
    #       @student_reviews << review
    #     end
    #   end
    # end
    
    # def show
    #   authorize @review
    #   @course = Course.find(@review.course_id)
    #   authorize @course
    # end
  
    def new
      @course = Course.find(params[:course_id])
      @review = Review.new
      authorize @review
    end
  
    def create
      @review = Review.new(set_review_params)
      authorize @review
      @review.course_id = params[:course_id]
      @review.user = current_user
      if @review.save
        redirect_to course_path(@review.course)
      else
        render :new
      end
    end
  
    # def edit
    #   authorize @review
    # end
  
    # def update
    #   authorize @review
    #   if @review.update(set_review_params)
    #     redirect_to review_path(@review)
    #   else
    #     render :edit
    #   end
    # end
  
    # def destroy
    #   authorize @review
    #   @review.destroy
    #   redirect_to reviews_path
    # end

    private
  
    def set_review
      @review = Review.find(params[:id])
    end
  
    def set_review_params
      params.require(:review).permit(:content, :stars)
    end
end
