require 'spec_helper'

describe "loans/edit" do
  before(:each) do
    @loan = assign(:loan, stub_model(Loan,
      :borrower => nil,
      :movie => nil
    ))
  end

  it "renders the edit loan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loans_path(@loan), :method => "post" do
      assert_select "input#loan_borrower", :name => "loan[borrower]"
      assert_select "input#loan_movie", :name => "loan[movie]"
    end
  end
end
