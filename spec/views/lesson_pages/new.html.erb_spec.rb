require 'spec_helper'

describe "lesson_pages/new.html.erb" do
  before(:each) do
    assign(:lesson_page, stub_model(LessonPage,
      :lessonID => 1,
      :orderNo => 1,
      :datasource => "MyString",
      :datatype => false
    ).as_new_record)
  end

  it "renders new lesson_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lesson_pages_path, :method => "post" do
      assert_select "input#lesson_page_lessonID", :name => "lesson_page[lessonID]"
      assert_select "input#lesson_page_orderNo", :name => "lesson_page[orderNo]"
      assert_select "input#lesson_page_datasource", :name => "lesson_page[datasource]"
      assert_select "input#lesson_page_datatype", :name => "lesson_page[datatype]"
    end
  end
end
