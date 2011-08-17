require 'spec_helper'

describe "student_details/new.html.erb" do
  before(:each) do
    assign(:student_detail, stub_model(StudentDetail,
      :name => "MyString",
      :classname => "MyString",
      :standard => "MyString"
    ).as_new_record)
  end

  it "renders new student_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => student_details_path, :method => "post" do
      assert_select "input#student_detail_name", :name => "student_detail[name]"
      assert_select "input#student_detail_classname", :name => "student_detail[classname]"
      assert_select "input#student_detail_standard", :name => "student_detail[standard]"
    end
  end
end
