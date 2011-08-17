require 'spec_helper'

describe "questionnaires/new.html.erb" do
  before(:each) do
    assign(:questionnaire, stub_model(Questionnaire,
      :questionnaireID => 1,
      :questionnaireName => "MyString",
      :questionID => ""
    ).as_new_record)
  end

  it "renders new questionnaire form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => questionnaires_path, :method => "post" do
      assert_select "input#questionnaire_questionnaireID", :name => "questionnaire[questionnaireID]"
      assert_select "input#questionnaire_questionnaireName", :name => "questionnaire[questionnaireName]"
      assert_select "input#questionnaire_questionID", :name => "questionnaire[questionID]"
    end
  end
end
