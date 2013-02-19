require 'spec_helper'

describe "loans/new" do
  before(:each) do
    assign(:loan, stub_model(Loan,
      :borrower => nil,
      :movie => nil
    ).as_new_record)
  end

  it "renders new loan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loans_path, :method => "post" do
      assert_select "input#loan_borrower", :name => "loan[borrower]"
      assert_select "input#loan_movie", :name => "loan[movie]"
    end
  end
end
