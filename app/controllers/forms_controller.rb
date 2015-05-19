class FormsController < ApplicationController

  def create
    questions = Question.all.as_json
    institute = Institute.find(params[:institute_id])
    form = Form.new
    params[:form][:votes_attributes].each do |lecturer|
      form.votes << Vote.new(
          lecturer: Lecturer.find(lecturer[1][:id].to_i),
          institute: institute,
          question_id: questions.shift["id"]
      )
    end

    if form.valid?
      form.save
    else
      # TODO
    end
    redirect_to polls_path
  end

  private

    def form_params
      params.require(:form).permit(:votes_attributes)
    end
end
