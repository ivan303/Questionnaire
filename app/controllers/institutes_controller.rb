class InstitutesController < ApplicationController

	layout "admin"
	before_filter :authenticate

	def index
		@institutes = Institute.all.order(:name)
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

	def edit
		@institute = Institute.find(params[:id])
		@lecturers = @institute.lecturers
		@other_lecturers = Lecturer.all - @lecturers
		@employments = @institute.employments
	end

	def update
		institute = Institute.find(params[:id])
		unless params[:institute].blank?
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
		else
			redirect_to edit_institute_path(institute.id)
		end
	end

	def destroy
		institute = Institute.find(params[:id])
		if institute.destroy
			flash[:success] = 'Instytut pomyślnie usunięty'
			redirect_to institutes_path
		else
			flash[:error] = 'Instytutu nie udało się usunąć'
			redirect_to institutes_path
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
