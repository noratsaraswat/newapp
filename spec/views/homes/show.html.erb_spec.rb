require 'spec_helper'

describe "homes/show.html.erb" do
  before(:each) do
    @home = assign(:home, stub_model(Home,
      :name => "Name",
      :place => "Place"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Place/)
  end
end
