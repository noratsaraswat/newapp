require 'spec_helper'

describe "content_infos/show.html.erb" do
  before(:each) do
    @content_info = assign(:content_info, stub_model(ContentInfo,
      :name => "Name",
      :path => "Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Path/)
  end
end
