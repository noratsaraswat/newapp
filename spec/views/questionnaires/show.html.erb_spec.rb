require 'spec_helper'

describe "questionnaires/show.html.erb" do
  before(:each) do
    @questionnaire = assign(:questionnaire, stub_model(Questionnaire,
      :questionnaireID => 1,
      :questionnaireName => "Questionnaire Name",
      :questionID => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Questionnaire Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
