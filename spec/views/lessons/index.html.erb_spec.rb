require 'spec_helper'

describe "lessons/index.html.erb" do
  before(:each) do
    assign(:lessons, [
      stub_model(Lesson,
        :lessonID => 1,
        :lessonName => "Lesson Name"
      ),
      stub_model(Lesson,
        :lessonID => 1,
        :lessonName => "Lesson Name"
      )
    ])
  end

  it "renders a list of lessons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lesson Name".to_s, :count => 2
  end
end
