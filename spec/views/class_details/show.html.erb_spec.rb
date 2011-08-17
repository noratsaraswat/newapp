require 'spec_helper'

describe "class_details/show.html.erb" do
  before(:each) do
    @class_detail = assign(:class_detail, stub_model(ClassDetail,
      :classname => "Classname"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Classname/)
  end
end
