class InstitutesController < ApplicationController
	# http_basic_authenticate_with name: "admin", password: "admin"
	USERS = { "lifo" => "world" }
	# before_filter :authenticate

	def index

	end

	def show
	end

	private
		def authenticate
			authenticate_or_request_with_http_digest do |username|
				USERS[username]
			end
		end

		# def person_params
		# 	params.require(:person)
		# end

end
