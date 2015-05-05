class InstituteController < ApplicationController
	def index
		@institutes = Institute.all
	end
end
