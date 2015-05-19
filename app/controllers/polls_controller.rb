class PollsController < ApplicationController

  def index
    @institutes = Institute.all
  end

  def create
    redirect_to  poll_path(params[:institute][:id])
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
