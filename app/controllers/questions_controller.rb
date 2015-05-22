class QuestionsController < ApplicationController

  layout "admin"
  before_filter :authenticate

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    if question.valid?
      question.save
      flash[:success] = 'Pytanie pomyślnie utworzone'
      redirect_to questions_path
    else
      flash[:error] = 'Pytania nie udało się utworzyć'
      redirect_to questions_path
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.content = question_params[:content]
    if question.valid?
      question.save
      flash[:success] = 'Pytanie pomyślnie zmodyfikowane'
      redirect_to questions_path
    else
      flash[:error] = 'Pytania nie udało się zmodyfikować'
      redirect_to questions_path
    end
  end

  def destroy
    question = Question.find(params[:id])
    if question.destroy
      flash[:success] = 'Pytanie pomyślnie usunięte'
      redirect_to questions_path
    else
      flash[:error] = 'Pytania nie udało się usunąć'
      redirect_to questions_path
    end

  end

  private

    def question_params
      params.require(:question).permit(:content)
    end
end
