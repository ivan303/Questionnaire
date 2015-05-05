class Employment < ActiveRecord::Base
  belongs_to :institute
  belongs_to :lecturer
end
