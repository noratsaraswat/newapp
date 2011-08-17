require 'spec_helper'

describe "questionnaires/index.html.erb" do
  before(:each) do
    assign(:questionnaires, [
      stub_model(Questionnaire,
        :questionnaireID => 1,
        :questionnaireName => "Questionnaire Name",
        :questionID => ""
      ),
      stub_model(Questionnaire,
        :questionnaireID => 1,
        :questionnaireName => "Questionnaire Name",
        :questionID => ""
      )
    ])
  end

  it "renders a list of questionnaires" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Questionnaire Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
