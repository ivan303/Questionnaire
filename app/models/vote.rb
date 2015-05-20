class Vote < ActiveRecord::Base
  belongs_to :lecturer
  belongs_to :institute
  belongs_to :question
  belongs_to :form

  def self.lastname_search (search)
    unless search.blank?
      search.downcase!
      Vote.joins('JOIN lecturers ON lecturers.id = votes.lecturer_id').where('LOWER(lecturers.lastname) LIKE ?', "%#{search}%")
    else
      Vote.all
    end
  end

  def self.firstname_search (search)
    unless search.blank?
      search.downcase!
      Vote.joins('JOIN lecturers ON lecturers.id = votes.lecturer_id').where('LOWER(lecturers.firstname) LIKE ?', "%#{search}%")
    else
      Vote.all
    end
  end

  def self.institute_search (search)
    unless search.blank?
      search.downcase!
      Vote.joins('JOIN institutes ON institutes.id = votes.institute_id').where('LOWER(institutes.name) LIKE ?', "%#{search}%")
    else
      Vote.all
    end
  end

  def self.ip_search (search)
    unless search.blank?
      Vote.where('ip LIKE ?', "%#{search}%")
    else
      Vote.all
    end
  end


end
