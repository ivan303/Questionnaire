class Question < ActiveRecord::Base
  has_many :votes, :dependent => :destroy

  validates :content, presence: true
end
