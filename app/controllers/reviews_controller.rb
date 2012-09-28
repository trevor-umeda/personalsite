class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @review.movie_id = params[:movie]
  end
  def create
     @review = Review.new(params[:review])
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
       format.html{redirect_to movies_path}
      else
      format.html
      end
    end

  end
end
