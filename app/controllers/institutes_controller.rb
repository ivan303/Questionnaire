class InstitutesController < ApplicationController
	# http_basic_authenticate_with name: "admin", password: "admin"
	USERS = { "lifo" => "world" }
	# before_filter :authenticate

	def index
		@institutes = Institute.all.order(:name)
	end

	def show
	end

	def edit
		@institute = Institute.find(params[:id])
		@lecturers = @institute.lecturers
		@employments = @institute.employments
	end

	def new
	end

	def create
		institute = Institute.new(institute_params)
		if institute.valid?
			institute.save
			redirect_to institutes_path
		else
			# TODO
		end

	end

	private

		def authenticate
			authenticate_or_request_with_http_digest do |username|
				USERS[username]
			end
		end

		def institute_params
			params.require(:institute).permit(:name)
		end

end
