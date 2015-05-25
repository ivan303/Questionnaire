class VotesController < ApplicationController

  layout "admin"
  before_filter :authenticate
  # before_filter :set_params

  def index
    # @direction = params[:direction]
    # @sort = params[:sort]
    # byebug
    @votes = Vote.lastname_search(params[:lastname_search])
                 .firstname_search(params[:firstname_search])
                 .institute_search(params[:institute_search])
                 .question_search(params[:question_search])
                 .ip_search(params[:ip_search])
                 .custom_sort(params[:sort], params[:direction])
                 .paginate(:per_page => 30, :page => params[:page])
  end

  # def set_params
  #   @direction = params[:direction]
  #   @sort = params[:sort]
  # end

end
