class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps null: false
    end
  end
end
