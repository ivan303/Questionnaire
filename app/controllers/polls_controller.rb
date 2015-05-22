class PollsController < ApplicationController

  def index
    @institutes = Institute.all
  end

  def create
    unless params[:institute].blank?
      redirect_to  poll_path(params[:institute][:id])
    else
      redirect_to polls_path
    end
  end

  def show
    @institute = Institute.find(params[:id])
    @form = Form.new
    @questions = Question.all.as_json

    @questions.each do |question|
      @form.votes.build(institute: @institute)
    end

    @lecturers = @institute.lecturers
  end

  def update

  end

end
