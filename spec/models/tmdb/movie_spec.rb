require 'spec_helper'

describe TMDB::Movie do

  describe "#find_by_id" do

    it 'searches with extended results' do
      TmdbMovie.should_receive(:find).with(id: 1, expand_results: true)
      TMDB::Movie.find_by_id(1).should be_instance_of(TMDB::Movie)
    end
  end

  describe "#new" do

    let(:tmdb_data) do
      OpenStruct.new({
        imdb_id: 't123'
      })
    end

    it 'fills in its attributes with the given data' do
      TMDB::Movie.new(tmdb_data).imdb_id.should eq(tmdb_data.imdb_id)
    end

    it 'builds its relations with the result from tmdb' do
      TMDB::Movie.new(tmdb_data).actors.should eq(tmdb_data.actors)
    end


  end

end
