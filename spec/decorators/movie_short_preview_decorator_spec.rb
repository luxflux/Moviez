require 'spec_helper'

describe MovieShortPreviewDecorator do

  let(:movie) do
    tmdb_result
  end

  subject do
    MovieShortPreviewDecorator.decorate(movie)
  end

  its(:id) { should eq(1) }
  its(:title) { should eq('Star Wars Episode VII') }
  its(:year) { should eq(1988) }

end

