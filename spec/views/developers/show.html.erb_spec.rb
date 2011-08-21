require 'spec_helper'

describe "developers/show.html.erb" do
  before(:each) do
    @developer = assign(:developer, stub_model(Developer,
      :userID => 1,
      :lessonID => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
