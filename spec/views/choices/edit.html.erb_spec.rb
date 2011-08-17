require 'spec_helper'

describe "choices/edit.html.erb" do
  before(:each) do
    @choice = assign(:choice, stub_model(Choice,
      :QuestionID => 1,
      :ChoiceAnswers => "MyString"
    ))
  end

  it "renders the edit choice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => choices_path(@choice), :method => "post" do
      assert_select "input#choice_QuestionID", :name => "choice[QuestionID]"
      assert_select "input#choice_ChoiceAnswers", :name => "choice[ChoiceAnswers]"
    end
  end
end
