class CreateDefaultOwner < ActiveRecord::Migration
  def up
    say_with_time 'creating owner and assigning all movies to him' do
      owner = Owner.create!(email: 'raffael@yux.ch', password: 'default-password')
      Movie.all.each do |movie|
        movie.owner = owner
        movie.save!
      end
    end
  end

  def down
  end
end
