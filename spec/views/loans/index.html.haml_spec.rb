require 'spec_helper'

describe "loans/index" do
  before(:each) do
    assign(:loans, [
      stub_model(Loan,
        :borrower => nil,
        :movie => nil
      ),
      stub_model(Loan,
        :borrower => nil,
        :movie => nil
      )
    ])
  end

  it "renders a list of loans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
