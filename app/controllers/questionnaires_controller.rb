class QuestionnairesController < ApplicationController

  def index
    @institutes = Institute.all
  end

  def create
    redirect_to  questionnaire_path(params[:institute][:id])
  end

  def show
    @institute = Institute.find(params[:id])
  end

  def update

  end

end
