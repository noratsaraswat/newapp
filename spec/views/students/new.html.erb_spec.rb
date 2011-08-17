require 'spec_helper'

describe "students/new.html.erb" do
  before(:each) do
    assign(:student, stub_model(Student,
      :name => "MyString",
      :classname => "MyString",
      :standard => "MyString"
    ).as_new_record)
  end

  it "renders new student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => students_path, :method => "post" do
      assert_select "input#student_name", :name => "student[name]"
      assert_select "input#student_classname", :name => "student[classname]"
      assert_select "input#student_standard", :name => "student[standard]"
    end
  end
end
