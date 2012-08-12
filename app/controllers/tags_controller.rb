class TagsController < ApplicationController
  def update
      @tag = Tag.find(params[:id])

      respond_to do |format|
        if @tag.update_attributes(params[:tag])
          format.html { redirect_to "/blog" }
          format.json { head :ok }
          format.js
        else
          format.html { render action: "edit" }
          format.json { render json: @project.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end
end