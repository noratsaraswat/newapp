require 'spec_helper'

describe "choices/new.html.erb" do
  before(:each) do
    assign(:choice, stub_model(Choice,
      :QuestionID => 1,
      :ChoiceAnswers => "MyString"
    ).as_new_record)
  end

  it "renders new choice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => choices_path, :method => "post" do
      assert_select "input#choice_QuestionID", :name => "choice[QuestionID]"
      assert_select "input#choice_ChoiceAnswers", :name => "choice[ChoiceAnswers]"
    end
  end
end
