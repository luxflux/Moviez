require 'cancan/matchers'

describe Ability do

  let(:user) { FactoryGirl.create(:user) }
  let(:movie) { FactoryGirl.create(:movie, user_id: user.id) }
  let(:borrower) { FactoryGirl.create(:borrower, user_id: user.id) }

  subject { ability }

  describe 'movie rights' do
    context 'as the user of the movie' do
      let(:ability) { Ability.new(user) }

      it { should be_able_to(:manage, movie) }
    end

    context 'as an other user' do
      let(:ability) { Ability.new(FactoryGirl.create(:user)) }

      it { should_not be_able_to(:manage, movie) }
      it { should be_able_to(:read, movie)}
    end

    context 'as an anonymous user' do
      let(:ability) { Ability.new(nil) }

      it { should_not be_able_to(:manage, movie) }
      it { should be_able_to(:read, movie)}
    end
  end

  describe 'borrower rights' do
    context 'as the user of the borrower' do
      let(:ability) { Ability.new(user) }

      it { should be_able_to(:manage, borrower) }
    end

    context 'as an other user' do
      let(:ability) { Ability.new(FactoryGirl.create(:user)) }

      it { should_not be_able_to(:manage, borrower) }
      it { should_not be_able_to(:read, borrower)}
    end
  end

end
