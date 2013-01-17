require 'spec_helper'
require 'ostruct'

describe TMDBMoviesController do

  let(:tmdb_movie) { tmdb_result }

  describe "GET 'show'" do
    it "returns http success" do
      TMDB::Movie.should_receive(:find_by_id).with("1").and_return(tmdb_movie)
      get 'show', id: 1
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      TMDB::Movie.should_receive(:search).with(title: 'Star Wars').and_return([tmdb_movie, tmdb_movie])
      get 'index', title: 'Star Wars'
      response.should be_success
    end
  end

end
