class QuestionsController < ApplicationController
  def create
    @question = Question.new(params[:question])
    @project = @question.project
    respond_to do |format|
      if @question.save
        format.html { redirect_to @project, notice: 'Question Successfully Posted.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render project_path(@project) }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    @question = Question.find(params[:id])
    @project = @question.project
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @project, notice: 'Question answered.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
end
