require 'spec_helper'
require 'ostruct'

describe TMDBMovieSearchController do

  let(:tmdb_movie) { tmdb_result }

  describe "GET 'show'" do
    it "returns http success" do
      TMDB::Movie.should_receive(:find_by_id).with("1").and_return(tmdb_movie)
      get 'show', id: 1
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

end
