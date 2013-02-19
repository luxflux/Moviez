class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :borrower
      t.references :movie

      t.timestamps
    end
    add_index :loans, :borrower_id
    add_index :loans, :movie_id
  end
end
