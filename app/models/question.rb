class Question < ActiveRecord::Base
  has_many :votes

  validates :content, presence: true
end
