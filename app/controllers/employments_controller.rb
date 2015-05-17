class EmploymentsController < ApplicationController

  def destroy
    institute_id = Employment.find(params[:id]).institute_id
    Employment.delete(params[:id])
    redirect_to edit_institute_path(institute_id)
  end
end
