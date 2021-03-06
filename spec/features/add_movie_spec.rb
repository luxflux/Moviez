require 'spec_helper'

describe 'add a movie' do

  let(:tmdb_movie) { tmdb_result }

  context 'as an authorized user' do
    it 'searches for the given title', js: true do
      user = FactoryGirl.create(:user, password: 'testing123')
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'testing123'
      click_on 'Sign in'

      TMDB::Movie.should_receive(:search).with(title: 'Star Wars').and_return([tmdb_movie])
      TMDB::Movie.should_receive(:find_by_id).with("1").twice.and_return(tmdb_movie)

      visit new_movie_path
      page.should_not have_content('Star Wars Episode VII')
      fill_in 'title', with: 'Star Wars'
      page.should have_content('Star Wars Episode VII')

      page.should_not have_content('A lot more words!')
      click_on 'Star Wars Episode VII (1988)'
      page.should have_content('A lot more words!')
      click_on 'Select'

      page.should have_css('h1', text: tmdb_movie.title)
      current_path.should eq("/movies/#{Movie.last.id}")
    end
  end

  context 'as an unauthorized user' do
    it 'does not allow access' do
      visit new_movie_path
      current_path.should eq('/movies')
      page.should have_content('not authorized')
    end
  end
end
