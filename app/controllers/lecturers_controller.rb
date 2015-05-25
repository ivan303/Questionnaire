class LecturersController < ApplicationController

  layout "admin"
  before_filter :authenticate

  def index
    @lecturers = Lecturer.all.order(:lastname)
  end

  def show
    @lecturer = Lecturer.find(params[:id])
  end

  def new
    @lecturer = Lecturer.new
  end

  def create
    lecturer = Lecturer.new(lecturer_params)
    if lecturer.valid?
      lecturer.save
      flash[:success] = "Wykładowca pomyślnie utworzony"
      redirect_to lecturers_path
    else
      flash[:error] = "Wykładowcy nie udało się utworzyć"
      redirect_to lecturers_path
    end
  end

  def edit
    @lecturer = Lecturer.find(params[:id])
  end

  def update
    @lecturer = Lecturer.find(params[:id])
    @lecturer.update(lecturer_params)
    if @lecturer.save
      flash[:success] = "Wykładowca pomyślnie zmodyfikowany"
      redirect_to lecturers_path
    else
      flash[:error] = "Wykładowcy nie udało się zmodyfikować"
      redirect_to lecturers_path
    end
  end

  def destroy
    lecturer = Lecturer.find(params[:id])
    if lecturer.destroy
      flash[:success] = "Wykładowca pomyślnie usunięty"
      redirect_to lecturers_path
    else
      flash[:error] = "Wykładowcy nie udało się usunąć"
      redirect_to lecturers_path
    end
  end

  private

    def lecturer_params
      params.require(:lecturer).permit(:firstname, :lastname, :title)
    end

end
