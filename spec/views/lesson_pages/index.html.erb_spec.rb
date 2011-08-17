require 'spec_helper'

describe "lesson_pages/index.html.erb" do
  before(:each) do
    assign(:lesson_pages, [
      stub_model(LessonPage,
        :lessonID => 1,
        :orderNo => 1,
        :datasource => "Datasource",
        :datatype => false
      ),
      stub_model(LessonPage,
        :lessonID => 1,
        :orderNo => 1,
        :datasource => "Datasource",
        :datatype => false
      )
    ])
  end

  it "renders a list of lesson_pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Datasource".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
