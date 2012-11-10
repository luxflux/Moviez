require 'spec_helper'

describe TMDB::Movie do

  describe "#find_by_id" do

    it 'searches with extended results' do
      TmdbMovie.should_receive(:find).with(id: 1, expand_results: true).and_return(tmdb_result)
      TMDB::Movie.find_by_id(1).should be_instance_of(TMDB::Movie)
    end
  end

  describe "#search" do

    it 'searches with the given attributes' do
      TmdbMovie.should_receive(:find).with(title: 'Star Wars', expand_results: false).and_return([tmdb_result, tmdb_result])
      TMDB::Movie.search(title: 'Star Wars').should be_instance_of(Array)
    end

  end

  describe "#new" do

    let(:tmdb_data) { tmdb_result }

    it 'fills in its attributes with the given data' do
      TMDB::Movie.new(tmdb_data).imdb_id.should eq(tmdb_data.imdb_id)
    end

    it 'builds its relations with the result from tmdb' do
      TMDB::Movie.new(tmdb_data).cast[0].id.should eq(524)
      TMDB::Movie.new(tmdb_data).cast[1].id.should eq(3061)
    end


  end

end
