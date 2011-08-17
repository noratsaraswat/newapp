require 'spec_helper'

describe "content_developers/index.html.erb" do
  before(:each) do
    assign(:content_developers, [
      stub_model(ContentDeveloper,
        :name => "Name"
      ),
      stub_model(ContentDeveloper,
        :name => "Name"
      )
    ])
  end

  it "renders a list of content_developers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
