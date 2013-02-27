require 'spec_helper'

describe "Borrowers" do
  describe "GET /borrowers" do
    it "works! (now write some real specs)" do
      user = FactoryGirl.create(:user, password: 'testing123')
      post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => 'testing123'

      get borrowers_path
      response.status.should be(200)
    end
  end
end
