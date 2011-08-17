require 'spec_helper'

describe "choices/index.html.erb" do
  before(:each) do
    assign(:choices, [
      stub_model(Choice,
        :QuestionID => 1,
        :ChoiceAnswers => "Choice Answers"
      ),
      stub_model(Choice,
        :QuestionID => 1,
        :ChoiceAnswers => "Choice Answers"
      )
    ])
  end

  it "renders a list of choices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Choice Answers".to_s, :count => 2
  end
end
