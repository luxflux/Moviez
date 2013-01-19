require 'spec_helper'

describe 'add a movie' do

  let(:tmdb_movie) { tmdb_result }

  it 'searches for the given title', js: true do
    TMDB::Movie.should_receive(:search).with(title: 'Star Wars').and_return([tmdb_movie, tmdb_movie])

    visit new_movie_path
    fill_in 'title', with: 'Star Wars'
    page.should have_content('Searching for movies')
    sleep 3.1
    page.should have_content('Star Wars Episode VII')

  end

end
