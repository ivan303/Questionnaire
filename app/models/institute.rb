class Institute < ActiveRecord::Base
  has_many :lecturers, through: :employments
  has_many :employments

  has_many :votes

  validatets :name, presence: true
end
