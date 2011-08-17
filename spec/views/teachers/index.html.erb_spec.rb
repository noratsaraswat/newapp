require 'spec_helper'

describe "teachers/index.html.erb" do
  before(:each) do
    assign(:teachers, [
      stub_model(Teacher,
        :lessionID => 1,
        :classname => "Classname",
        :classID => 1
      ),
      stub_model(Teacher,
        :lessionID => 1,
        :classname => "Classname",
        :classID => 1
      )
    ])
  end

  it "renders a list of teachers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Classname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
