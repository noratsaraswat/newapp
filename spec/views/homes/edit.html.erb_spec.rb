require 'spec_helper'

describe "homes/edit.html.erb" do
  before(:each) do
    @home = assign(:home, stub_model(Home,
      :name => "MyString",
      :place => "MyString"
    ))
  end

  it "renders the edit home form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => homes_path(@home), :method => "post" do
      assert_select "input#home_name", :name => "home[name]"
      assert_select "input#home_place", :name => "home[place]"
    end
  end
end
