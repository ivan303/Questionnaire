class Institute < ActiveRecord::Base
  has_many :lecturers, through: :employments
  has_many :employments, :dependent => :destroy

  has_many :votes, :dependent => :destroy

  validates :name, presence: true
end
