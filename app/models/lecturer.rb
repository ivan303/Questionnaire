class Lecturer < ActiveRecord::Base
  has_many :institutes, through: :employments
  has_many :employments, :dependent => :destroy

  has_many :votes, :dependent => :destroy


  validates :firstname, presence: true
  validates :lastname, presence: true
end
