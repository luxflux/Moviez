require 'cancan/matchers'

describe Ability do

  let(:owner) { FactoryGirl.create(:owner) }
  let(:movie) { FactoryGirl.create(:movie, owner_id: owner.id) }

  context 'as the owner of the movie' do
    let(:ability) { Ability.new(owner) }

    subject { ability }

    it { should be_able_to(:manage, movie) }
  end

  context 'as an other user' do
    let(:ability) { Ability.new(FactoryGirl.create(:owner)) }

    subject { ability }

    it { should_not be_able_to(:manage, movie) }
    it { should be_able_to(:read, movie)}
  end

  context 'as an anonymous user' do
    let(:ability) { Ability.new(nil) }

    subject { ability }

    it { should_not be_able_to(:manage, movie) }
    it { should be_able_to(:read, movie)}
  end

end
