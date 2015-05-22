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

  def self.custom_sort (sort_by, direction)
    unless sort_by.blank?
      direction = %w[asc desc].include?(direction) ? direction : "asc"
      case sort_by
        when "institute_id" then Vote.joins('JOIN institutes ON institutes.id = votes.institute_id').order('institutes.name' + ' ' + direction)
        when "lecturer_id" then Vote.joins('JOIN lecturers ON lecturers.id = votes.lecturer_id').order('lecturers.lastname' + ' ' + direction)
        when "question_id" then Vote.joins('JOIN questions ON questions.id = votes.question_id').order('questions.content' + ' ' + direction)
        when "ip" then Vote.order('ip' + ' ' + direction)
        else Vote.all
      end
    else
      Vote.all
    end
  end


end
