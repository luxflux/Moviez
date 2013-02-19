class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|

      t.timestamps
    end
  end
end
