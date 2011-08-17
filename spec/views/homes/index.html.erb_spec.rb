require 'spec_helper'

describe "homes/index.html.erb" do
  before(:each) do
    assign(:homes, [
      stub_model(Home,
        :name => "Name",
        :place => "Place"
      ),
      stub_model(Home,
        :name => "Name",
        :place => "Place"
      )
    ])
  end

  it "renders a list of homes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Place".to_s, :count => 2
  end
end
