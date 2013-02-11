class AddOwnerReferenceToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :owner_id, :integer
  end
end
