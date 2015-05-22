class Institute < ActiveRecord::Base
  has_many :lecturers, through: :employments
  has_many :employments, :dependent => :destroy

  has_many :votes

  validates :name, presence: true
end
