require 'spec_helper'

describe "admin_people/new.html.erb" do
  before(:each) do
    assign(:admin_person, stub_model(AdminPerson,
      :UserID => 1,
      :lessonID => 1
    ).as_new_record)
  end

  it "renders new admin_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_people_path, :method => "post" do
      assert_select "input#admin_person_UserID", :name => "admin_person[UserID]"
      assert_select "input#admin_person_lessonID", :name => "admin_person[lessonID]"
    end
  end
end
