class MoviesController < ApplicationController
  def index
      @movies = Movie.all
      @movies.sort!{|a,b| b.created_at <=> a.created_at}
      @review = Review.new
      if current_user
      @review.user_id = current_user.id
      end
  end
  def new
    @movie = Movie.new
  end
  def create
    @movie = Movie.new(params[:movie])
    respond_to do |format|
          if @movie.save
            @review = Review.new
                @review.movie_id = @movie.id
                @review.user_id = current_user.id
                @review.description = @movie.description
            @review.save
            format.html { redirect_to movies_path }

            format.js
          else
            format.html { render action: "new" }
            format.js
          end
        end
  end
  def edit
    @movie = Movie.find(params[:id])
  end
  def update
    @movie = Movie.find(params[:id])
    respond_to do |format|
          if @movie.update_attributes(params[:movie])
            format.html {redirect_to movies_path }
          else
            format.html
          end
        end
  end
  def rate
      @movie = Movie.find(params[:id])
      puts current_user
      @movie.rate(params[:stars],current_user)
      respond_to do |format|
        format.js

      end
  end
end
