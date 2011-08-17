require 'spec_helper'

describe "lessons/new.html.erb" do
  before(:each) do
    assign(:lesson, stub_model(Lesson,
      :lessonID => 1,
      :lessonName => "MyString"
    ).as_new_record)
  end

  it "renders new lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path, :method => "post" do
      assert_select "input#lesson_lessonID", :name => "lesson[lessonID]"
      assert_select "input#lesson_lessonName", :name => "lesson[lessonName]"
    end
  end
end
