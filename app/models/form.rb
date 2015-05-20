class Form < ActiveRecord::Base
  has_many :votes, :dependent => :destroy
  accepts_nested_attributes_for :votes

  def self.institute_search (search)
    unless search.blank?
      search.downcase!
      Form.joins('JOIN votes ON forms.id = votes.form_id JOIN institutes ON institutes.id = votes.institute_id ')
          .where('LOWER(institutes.name) LIKE ?', "%#{search}%")
          .group('forms.id')
    else
      Form.all
    end
  end

  def self.ip_search (search)
    unless search.blank?
      Form.joins('JOIN votes ON forms.id = votes.form_id')
          .where('ip LIKE ?', "%#{search}%")
          .group('forms.id')
    else
      Form.all
    end
  end

  def self.custom_sort (sort_by)
    unless sort_by.blank?
      # byebug
      # Vote.all
      case sort_by
        when "institute_id" then Form.joins('JOIN votes ON forms.id = votes.form_id JOIN institutes ON institutes.id = votes.institute_id ')
                                     .group('forms.id, institutes.name')
                                     .order('institutes.name')
                                     # .group('forms.id')

        when "ip" then Form.joins('JOIN votes ON forms.id = votes.form_id')
                           .group('forms.id, votes.ip')
                           .order('votes.ip')


      end
    else
      # byebug
      Form.all
    end
  end

end
