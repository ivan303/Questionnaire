class AddsFormIdColumnToVote < ActiveRecord::Migration
  def change
    add_column :votes, :form_id, :integer
  end
end
