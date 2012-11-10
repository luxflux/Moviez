require 'spec_helper'

describe MovieFullPreviewDecorator do

  let(:movie) do
    tmdb_result
  end

  subject do
    MovieFullPreviewDecorator.decorate(movie)
  end

  its(:id) { should eq(1) }
  its(:title) { should eq('Star Wars Episode VII') }
  its(:year) { should eq(1988) }

  its(:tagline) { should eq('Not so much words') }
  its(:overview) { should eq('A lot more words!') }
  its(:imdb_id) { should eq('t123') }
  its(:cover_url) { should eq('http://tmdb.org/nice_pic.png') }
  its(:length) { should eq(144) }
  its(:languages) { should eq('English, German, and Spanish') }
  its(:genres) { should eq('Science-Fiction and Action') }
  its(:cast) { should eq('Natalie Portman (Queen Amidala) and Ewan McGregor (Obi Wan Kenobi)') }


end
