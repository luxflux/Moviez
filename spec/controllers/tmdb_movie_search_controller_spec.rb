require 'spec_helper'
require 'ostruct'

describe TMDBMovieSearchController do

  let(:data_from_tmdb) do
    OpenStruct.new(
      id: 1,
      imdb_id: 't123',
    )
  end

  describe "GET 'show'" do
    it "returns http success" do
      TMDB::Movie.should_receive(:find_by_id).with("1").returns(data_from_tmdb)
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
