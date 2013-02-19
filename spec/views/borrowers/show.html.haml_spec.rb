require 'spec_helper'

describe "borrowers/show" do
  before(:each) do
    @borrower = assign(:borrower, stub_model(Borrower,
      :first_name => "First Name",
      :family_name => "Family Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Family Name/)
    rendered.should match(/Email/)
  end
end
