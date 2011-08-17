require 'spec_helper'

describe "lessons/show.html.erb" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson,
      :lessonID => 1,
      :lessonName => "Lesson Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lesson Name/)
  end
end
