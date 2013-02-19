require 'spec_helper'

describe "borrowers/index" do
  before(:each) do
    assign(:borrowers, [
      stub_model(Borrower,
        :first_name => "First Name",
        :family_name => "Family Name",
        :email => "Email"
      ),
      stub_model(Borrower,
        :first_name => "First Name",
        :family_name => "Family Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of borrowers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Family Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
