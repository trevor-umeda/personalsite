class BlogsController < ApplicationController
  def new

  end
  def index
    @tags = Tag.all
    @blog = Blog.new
    if params[:tag]
        @tag = Tag.find(params[:tag])
      @blogs = @tag.blogs
        @blogs.sort!{|a,b| b.created_at <=> a.created_at}

    else
      @tag = Tag.find_by_name("Life")
      if @tag
        @blogs = @tag.blogs.order(:created_at)
        @blogs.sort!{|a,b| b.created_at <=> a.created_at}

      else
        @blogs = Blog.all
      end

    end

    respond_to do |format|
      format.html # show.html.erb
      format.js

    end
  end
  def create
    @blog = Blog.new(params[:blog])
    puts "Updating a blog"
    if params[:tag_name] != ""
      if !Tag.find_by_name(params[:tag_name])
      @newTag = Tag.create(:name => params[:tag_name])
      @blog.tag_id = @newTag.id
      end
    end
     respond_to do |format|
      if @blog.save
        format.html { redirect_to "/blog", notice: 'Project was successfully created.' }
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
      format.html { redirect_to "/blog" }
      format.json { head :ok }
    end
  end
end
