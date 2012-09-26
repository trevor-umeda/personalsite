class MoviesController < ApplicationController
  def index
      @movies = Movie.all
  end
  def new
    @movie = Movie.new
  end
  def create
    @movie = Movie.new(params[:movie])
    respond_to do |format|
          if @movie.save
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
      @movie.rate(params[:stars],@movie)
      respond_to do |format|
        format.js

      end
  end
end
