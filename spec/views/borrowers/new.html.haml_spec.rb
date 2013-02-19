require 'spec_helper'

describe "borrowers/new" do
  before(:each) do
    assign(:borrower, stub_model(Borrower,
      :first_name => "MyString",
      :family_name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new borrower form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => borrowers_path, :method => "post" do
      assert_select "input#borrower_first_name", :name => "borrower[first_name]"
      assert_select "input#borrower_family_name", :name => "borrower[family_name]"
      assert_select "input#borrower_email", :name => "borrower[email]"
    end
  end
end
