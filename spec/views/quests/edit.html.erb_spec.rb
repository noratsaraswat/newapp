require 'spec_helper'

describe "quests/edit.html.erb" do
  before(:each) do
    @quest = assign(:quest, stub_model(Quest,
      :questionnaireID => 1,
      :question => "MyString",
      :image => "MyString",
      :answer => "MyString"
    ))
  end

  it "renders the edit quest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quests_path(@quest), :method => "post" do
      assert_select "input#quest_questionnaireID", :name => "quest[questionnaireID]"
      assert_select "input#quest_question", :name => "quest[question]"
      assert_select "input#quest_image", :name => "quest[image]"
      assert_select "input#quest_answer", :name => "quest[answer]"
    end
  end
end
