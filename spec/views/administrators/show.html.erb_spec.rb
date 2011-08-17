require 'spec_helper'

describe "administrators/show.html.erb" do
  before(:each) do
    @administrator = assign(:administrator, stub_model(Administrator,
      :name => "Name",
      :lessionID => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
