class CreateDefaultUser < ActiveRecord::Migration
  def up
    say_with_time 'creating user and assigning all movies to him' do
      user = User.create!(email: 'raffael@yux.ch', password: 'default-password')
      Movie.all.each do |movie|
        movie.user = user
        movie.save!
      end
    end
  end

  def down
  end
end
