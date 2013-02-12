require 'cancan/matchers'

describe Ability do

  let(:user) { FactoryGirl.create(:user) }
  let(:movie) { FactoryGirl.create(:movie, user_id: user.id) }

  context 'as the user of the movie' do
    let(:ability) { Ability.new(user) }

    subject { ability }

    it { should be_able_to(:manage, movie) }
  end

  context 'as an other user' do
    let(:ability) { Ability.new(FactoryGirl.create(:user)) }

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
