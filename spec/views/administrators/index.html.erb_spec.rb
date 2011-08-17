require 'spec_helper'

describe "administrators/index.html.erb" do
  before(:each) do
    assign(:administrators, [
      stub_model(Administrator,
        :name => "Name",
        :lessionID => 1
      ),
      stub_model(Administrator,
        :name => "Name",
        :lessionID => 1
      )
    ])
  end

  it "renders a list of administrators" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
