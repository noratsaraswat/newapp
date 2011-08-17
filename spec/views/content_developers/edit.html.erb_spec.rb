require 'spec_helper'

describe "content_developers/edit.html.erb" do
  before(:each) do
    @content_developer = assign(:content_developer, stub_model(ContentDeveloper,
      :name => "MyString"
    ))
  end

  it "renders the edit content_developer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => content_developers_path(@content_developer), :method => "post" do
      assert_select "input#content_developer_name", :name => "content_developer[name]"
    end
  end
end
