class LecturersController < ApplicationController

  def index
    @lecturers = Lecturer.all.order(:lastname)
  end

  def show
  end

  def new
    @lecturer = Lecturer.new
  end

  def create
    lecturer = Lecturer.new(lecturer_params)
    if lecturer.valid?
      lecturer.save
      redirect_to lecturers_path
    else
      # TODO
    end
  end

  def destroy
    lecturer = Lecturer.find(params[:id])
    lecturer.delete
    redirect_to lecturers_path
  end

  private

    def lecturer_params
      params.require(:lecturer).permit(:firstname, :lastname)
    end
end
