class AddsIdColumnsToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :institute_id, :integer
    add_column :votes, :lecturer_id, :integer
    add_column :votes, :question_id, :integer
  end
end
