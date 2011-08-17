require 'spec_helper'

describe "content_infos/index.html.erb" do
  before(:each) do
    assign(:content_infos, [
      stub_model(ContentInfo,
        :name => "Name",
        :path => "Path"
      ),
      stub_model(ContentInfo,
        :name => "Name",
        :path => "Path"
      )
    ])
  end

  it "renders a list of content_infos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Path".to_s, :count => 2
  end
end
