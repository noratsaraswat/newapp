require 'spec_helper'

describe "student_details/show.html.erb" do
  before(:each) do
    @student_detail = assign(:student_detail, stub_model(StudentDetail,
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
