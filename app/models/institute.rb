class Institute < ActiveRecord::Base
  validatets :name, presence: true
end
