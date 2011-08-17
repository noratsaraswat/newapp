require 'spec_helper'

describe "teachers/show.html.erb" do
  before(:each) do
    @teacher = assign(:teacher, stub_model(Teacher,
      :lessionID => 1,
      :classname => "Classname",
      :classID => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Classname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
