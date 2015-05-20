class FormsController < ApplicationController

  layout "admin"
  before_filter :authenticate, except: :create

  def index
    @forms = Form.institute_search(params[:institute_search])
                 .ip_search(params[:ip_search])
                 .custom_sort(params[:sort])
                 .paginate(:per_page => 30, :page => params[:page])
  end

  def show
    @form = Form.find(params[:id])
  end

  def create
    questions = Question.all.as_json
    institute = Institute.find(params[:institute_id])
    form = Form.new
    params[:form][:votes_attributes].each do |lecturer|
      form.votes << Vote.new(
          lecturer: Lecturer.find(lecturer[1][:id].to_i),
          institute: institute,
          question_id: questions.shift["id"],
          ip: request.remote_ip
      )
    end

    if form.valid?
      form.save
    else
      # TODO
    end
    redirect_to polls_path
  end

  def destroy
    form = Form.find(params[:id])
    form.destroy
    redirect_to forms_path
  end

  private

    def form_params
      params.require(:form).permit(:votes_attributes)
    end
end
