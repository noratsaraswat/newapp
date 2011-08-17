require 'spec_helper'

describe "quests/show.html.erb" do
  before(:each) do
    @quest = assign(:quest, stub_model(Quest,
      :questionnaireID => 1,
      :question => "Question",
      :image => "Image",
      :answer => "Answer"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Question/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Answer/)
  end
end
