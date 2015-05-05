class Lecturer < ActiveRecord::Base
  has_many :institutes, through: :employments
  has_many :employments

  has_many :votes


  validates :firstname, presence: true
  validates :lastname, presence: true
end
