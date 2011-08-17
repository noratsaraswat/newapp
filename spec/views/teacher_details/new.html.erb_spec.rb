require 'spec_helper'

describe "teacher_details/new.html.erb" do
  before(:each) do
    assign(:teacher_detail, stub_model(TeacherDetail,
      :lessionID => 1,
      :classname => "MyString",
      :classID => 1
    ).as_new_record)
  end

  it "renders new teacher_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teacher_details_path, :method => "post" do
      assert_select "input#teacher_detail_lessionID", :name => "teacher_detail[lessionID]"
      assert_select "input#teacher_detail_classname", :name => "teacher_detail[classname]"
      assert_select "input#teacher_detail_classID", :name => "teacher_detail[classID]"
    end
  end
end
