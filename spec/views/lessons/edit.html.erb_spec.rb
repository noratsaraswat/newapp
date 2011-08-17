require 'spec_helper'

describe "lessons/edit.html.erb" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson,
      :lessonID => 1,
      :lessonName => "MyString"
    ))
  end

  it "renders the edit lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path(@lesson), :method => "post" do
      assert_select "input#lesson_lessonID", :name => "lesson[lessonID]"
      assert_select "input#lesson_lessonName", :name => "lesson[lessonName]"
    end
  end
end
