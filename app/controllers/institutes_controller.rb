class InstitutesController < ApplicationController

	layout "admin"
	before_filter :authenticate

	def index
		@institutes = Institute.all.order(:name)
	end

	def show
	end

	def edit
		@institute = Institute.find(params[:id])
		@lecturers = @institute.lecturers
		@employments = @institute.employments
		
		@other_lecturers = Lecturer.all - @lecturers

	end

	def new
		@institute = Institute.new
	end

	def create
		institute = Institute.new(institute_params)
		if institute.valid?
			institute.save
			flash[:success] = 'Instytut pomyślnie utworzony'
			redirect_to institutes_path
		else
			flash[:error] = 'Instytutu nie udało się utworzyć'
			redirect_to institutes_path
		end
	end

	def update
		institute = Institute.find(params[:id])
		employment = Employment.new
		employment.institute = institute
		employment.lecturer = Lecturer.find(new_employment_params[:lecturers].to_i)
		if employment.valid?
			employment.save
			flash[:success] = 'Wykładowca pomyślnie dodany do instytutu'
			redirect_to edit_institute_path(institute.id)
		else
			flash[:error] = 'Wykładowcy nie udało się dodać do instytutu'
			redirect_to edit_institute_path(institute.id)
		end

	end

	private

		def institute_params
			params.require(:institute).permit(:name)
		end

		def new_employment_params
			params.require(:institute).permit(:lecturers)
		end

end
