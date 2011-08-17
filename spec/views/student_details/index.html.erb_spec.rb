require 'spec_helper'

describe "student_details/index.html.erb" do
  before(:each) do
    assign(:student_details, [
      stub_model(StudentDetail,
        :name => "Name",
        :classname => "Classname",
        :standard => "Standard"
      ),
      stub_model(StudentDetail,
        :name => "Name",
        :classname => "Classname",
        :standard => "Standard"
      )
    ])
  end

  it "renders a list of student_details" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Classname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Standard".to_s, :count => 2
  end
end
