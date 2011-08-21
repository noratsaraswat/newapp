require 'spec_helper'

describe "class_details/index.html.erb" do
  before(:each) do
    assign(:class_details, [
      stub_model(ClassDetail,
        :classname => "Classname"
      ),
      stub_model(ClassDetail,
        :classname => "Classname"
      )
    ])
  end

  it "renders a list of class_details" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Classname".to_s, :count => 2
  end
end
