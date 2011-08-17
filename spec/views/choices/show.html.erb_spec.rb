require 'spec_helper'

describe "choices/show.html.erb" do
  before(:each) do
    @choice = assign(:choice, stub_model(Choice,
      :QuestionID => 1,
      :ChoiceAnswers => "Choice Answers"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Choice Answers/)
  end
end
