class AddFieldsToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :tagline, :text
    add_column :movies, :release_date, :datetime

    add_column :movies, :overview, :text
    remove_column :movies, :description
  end
end
