require 'spec_helper'

describe "borrowers/index" do
  before(:each) do
    assign(:borrowers, [
      stub_model(Borrower),
      stub_model(Borrower)
    ])
  end

  it "renders a list of borrowers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
