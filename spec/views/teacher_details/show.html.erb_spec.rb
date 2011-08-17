require 'spec_helper'

describe "teacher_details/show.html.erb" do
  before(:each) do
    @teacher_detail = assign(:teacher_detail, stub_model(TeacherDetail,
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
