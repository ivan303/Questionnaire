class AddTitleFieldToLecturer < ActiveRecord::Migration
  def change
    add_column :lecturers, :title, :string
  end
end
