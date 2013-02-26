class AddBorrowerIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :borrower_id, :integer
  end
end
