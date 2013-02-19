class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :family_name
      t.string :email

      t.timestamps
    end
  end
end
