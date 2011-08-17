require 'spec_helper'

describe "lesson_pages/show.html.erb" do
  before(:each) do
    @lesson_page = assign(:lesson_page, stub_model(LessonPage,
      :lessonID => 1,
      :orderNo => 1,
      :datasource => "Datasource",
      :datatype => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Datasource/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
