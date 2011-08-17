require 'spec_helper'

describe "administrators/edit.html.erb" do
  before(:each) do
    @administrator = assign(:administrator, stub_model(Administrator,
      :name => "MyString",
      :lessionID => 1
    ))
  end

  it "renders the edit administrator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => administrators_path(@administrator), :method => "post" do
      assert_select "input#administrator_name", :name => "administrator[name]"
      assert_select "input#administrator_lessionID", :name => "administrator[lessionID]"
    end
  end
end
