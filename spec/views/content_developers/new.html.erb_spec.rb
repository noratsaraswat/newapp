require 'spec_helper'

describe "content_developers/new.html.erb" do
  before(:each) do
    assign(:content_developer, stub_model(ContentDeveloper,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new content_developer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => content_developers_path, :method => "post" do
      assert_select "input#content_developer_name", :name => "content_developer[name]"
    end
  end
end
