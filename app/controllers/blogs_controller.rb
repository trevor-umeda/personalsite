class BlogsController < ApplicationController
  def new

  end
  def index
    @blogs = Blog.find(:all, :order => "created_at DESC")
    @blog = Blog.new

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  def create
    @blog = Blog.new(params[:blog])
     respond_to do |format|
      if @blog.save
        format.html { redirect_to blogs_path, notice: 'Project was successfully created.' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "index" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_path }
      format.json { head :ok }
    end
  end
end
