class VotesController < ApplicationController

  def index
    @votes = Vote.lastname_search(params[:lastname_search])
                 .firstname_search(params[:firstname_search])
                 .institute_search(params[:institute_search])
                 .ip_search(params[:ip_search])
                 .paginate(:per_page => 20, :page => params[:page])
  end


end
