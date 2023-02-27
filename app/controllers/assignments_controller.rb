class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to assignments_url, notice: "Assignment was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def toggle
    @assignment = Assignment.find(params[:id])
    @assignment.update(completed: params[:completed])
  
    render json: { message: "Success" }
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to assignments_url, notice: "Task was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to assignments_url, notice: "Post was successfully deleted."
  end

  private

  def assignment_params
    params.require(:assignment).permit(:description)
  end
end
