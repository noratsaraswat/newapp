require 'spec_helper'

describe "content_infos/edit.html.erb" do
  before(:each) do
    @content_info = assign(:content_info, stub_model(ContentInfo,
      :name => "MyString",
      :path => "MyString"
    ))
  end

  it "renders the edit content_info form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => content_infos_path(@content_info), :method => "post" do
      assert_select "input#content_info_name", :name => "content_info[name]"
      assert_select "input#content_info_path", :name => "content_info[path]"
    end
  end
end
