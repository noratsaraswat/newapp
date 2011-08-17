require 'spec_helper'

describe "quests/index.html.erb" do
  before(:each) do
    assign(:quests, [
      stub_model(Quest,
        :questionnaireID => 1,
        :question => "Question",
        :image => "Image",
        :answer => "Answer"
      ),
      stub_model(Quest,
        :questionnaireID => 1,
        :question => "Question",
        :image => "Image",
        :answer => "Answer"
      )
    ])
  end

  it "renders a list of quests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
  end
end
