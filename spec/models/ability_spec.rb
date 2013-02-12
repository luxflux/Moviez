require 'cancan/matchers'

describe Ability do

  let(:owner) { FactoryGirl.create(:owner) }
  let(:movie) { FactoryGirl.create(:movie, owner_id: owner.id) }

  context 'owner of the movie' do
    let(:ability) { Ability.new(owner) }

    subject { ability }

    it { should be_able_to(:manage, movie) }
  end

  context "other user" do
    let(:ability) { Ability.new(FactoryGirl.create(:owner)) }

    subject { ability }

    it { should_not be_able_to(:manage, movie) }
    it { should be_able_to(:read, movie)}
  end

end
