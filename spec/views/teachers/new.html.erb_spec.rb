require 'spec_helper'

describe "teachers/new.html.erb" do
  before(:each) do
    assign(:teacher, stub_model(Teacher,
      :lessionID => 1,
      :classname => "MyString",
      :classID => 1
    ).as_new_record)
  end

  it "renders new teacher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teachers_path, :method => "post" do
      assert_select "input#teacher_lessionID", :name => "teacher[lessionID]"
      assert_select "input#teacher_classname", :name => "teacher[classname]"
      assert_select "input#teacher_classID", :name => "teacher[classID]"
    end
  end
end
