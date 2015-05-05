class Vote < ActiveRecord::Base
  belongs_to :lecturer
  belongs_to :institute
  belongs_to :question
end
