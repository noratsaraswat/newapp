require 'spec_helper'

describe "content_infos/new.html.erb" do
  before(:each) do
    assign(:content_info, stub_model(ContentInfo,
      :name => "MyString",
      :path => "MyString"
    ).as_new_record)
  end

  it "renders new content_info form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => content_infos_path, :method => "post" do
      assert_select "input#content_info_name", :name => "content_info[name]"
      assert_select "input#content_info_path", :name => "content_info[path]"
    end
  end
end
