class Vote < ActiveRecord::Base
  belongs_to :lecturer
  belongs_to :institute
  belongs_to :question
  belongs_to :form
end
