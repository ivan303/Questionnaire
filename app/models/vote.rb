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

  def self.custom_sort (sort_by)
    unless sort_by.blank?
      # byebug
      # Vote.all
      case sort_by
        when "institute_id" then Vote.joins('JOIN institutes ON institutes.id = votes.institute_id').order('institutes.name')
        when "lecturer_id" then Vote.joins('JOIN lecturers ON lecturers.id = votes.lecturer_id').order('lecturers.lastname')
        when "question_id" then Vote.joins('JOIN questions ON questions.id = votes.question_id').order('questions.content')
        when "ip" then Vote.order('ip')
      end
    else
      # byebug
      Vote.all
    end
  end


end
