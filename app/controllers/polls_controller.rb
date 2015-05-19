class PollsController < ApplicationController

  def index
    @institutes = Institute.all
  end

  def create
    redirect_to  questionnaire_path(params[:institute][:id])
  end

  def show
    @institute = Institute.find(params[:id])
    @questions = Question.all
    @lecturers = @institute.lecturers
    # byebug
  end

  def update

  end

end
