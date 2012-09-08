class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :disc_number
      t.boolean :watched

      t.timestamps
    end
    add_index :movies, :disc_number, :unique => true
  end
end
