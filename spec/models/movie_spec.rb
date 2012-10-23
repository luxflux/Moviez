require 'spec_helper'

describe Movie do

  describe "#load_attributes_from_tmdb_data" do

    subject do
      Movie.new
    end

    its(:load_attributes_from_tmdb_data) { should be_instance_of(Movie) }


  end

end
