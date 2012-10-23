require 'spec_helper'

describe Movie do

  describe "#load_attributes_from_tmdb_data" do

    let(:movie) do
      Movie.new
    end

    let(:tmdb_data) do
      OpenStruct.new()
    end

    subject do
      movie.load_attributes_from_tmdb_data(tmdb_data)
    end

    it { should be_instance_of(Movie) }

    its(:title) { should eq(tmdb_data.title) }
    its(:imdb_id) { should eq(tmdb_data.imdb_id) }


  end

end
