class AddIdColumnsToEmployment < ActiveRecord::Migration
  def change
    add_column :employments, :institute_id, :integer
    add_column :employments, :lecturer_id, :integer
  end
end
