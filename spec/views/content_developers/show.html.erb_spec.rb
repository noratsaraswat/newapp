require 'spec_helper'

describe "content_developers/show.html.erb" do
  before(:each) do
    @content_developer = assign(:content_developer, stub_model(ContentDeveloper,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
