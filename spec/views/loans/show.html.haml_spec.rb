require 'spec_helper'

describe "loans/show" do
  before(:each) do
    @loan = assign(:loan, stub_model(Loan,
      :borrower => nil,
      :movie => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
