require 'spec_helper'

describe "teachers/edit.html.erb" do
  before(:each) do
    @teacher = assign(:teacher, stub_model(Teacher,
      :lessionID => 1,
      :classname => "MyString",
      :classID => 1
    ))
  end

  it "renders the edit teacher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teachers_path(@teacher), :method => "post" do
      assert_select "input#teacher_lessionID", :name => "teacher[lessionID]"
      assert_select "input#teacher_classname", :name => "teacher[classname]"
      assert_select "input#teacher_classID", :name => "teacher[classID]"
    end
  end
end
