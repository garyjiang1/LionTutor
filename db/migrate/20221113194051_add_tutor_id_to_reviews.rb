class AddTutorIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :tutor_id, :integer
  end
end
