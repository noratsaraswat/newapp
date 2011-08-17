require 'spec_helper'

describe "students/show.html.erb" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :name => "Name",
      :classname => "Classname",
      :standard => "Standard"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Classname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Standard/)
  end
end
