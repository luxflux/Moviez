require 'spec_helper'

describe Movie do

  describe "#load_attributes_from_tmdb_data" do

    let(:movie) do
      ::Movie.new
    end

    let(:tmdb_data) do
      tmdb_result
    end

    subject do
      movie.load_attributes_from_tmdb_data(tmdb_data)
    end

    it { should be_instance_of(::Movie) }

    its(:title) { should eq(tmdb_data.title) }
    its(:title) { should_not be_nil }
    its(:imdb_id) { should eq(tmdb_data.imdb_id) }
    its(:imdb_id) { should_not be_nil }
    its(:overview) { should eq(tmdb_data.overview) }
    its(:overview) { should_not be_nil }
    its(:tagline) { should eq(tmdb_data.tagline) }
    its(:tagline) { should_not be_nil }

  end

  describe "#watched" do
    let(:movie) do
      FactoryGirl.build(:movie)
    end

    it 'sets the default for watched' do
      movie.valid?
      movie.watched.should be_false
    end

    it 'does not halt the filter chain' do
      movie.save.should be_true
    end
  end

end
