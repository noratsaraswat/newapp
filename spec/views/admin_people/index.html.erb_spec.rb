require 'spec_helper'

describe "admin_people/index.html.erb" do
  before(:each) do
    assign(:admin_people, [
      stub_model(AdminPerson,
        :UserID => 1,
        :lessonID => 1
      ),
      stub_model(AdminPerson,
        :UserID => 1,
        :lessonID => 1
      )
    ])
  end

  it "renders a list of admin_people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
