require 'spec_helper'

describe "class_details/edit.html.erb" do
  before(:each) do
    @class_detail = assign(:class_detail, stub_model(ClassDetail,
      :classname => "MyString"
    ))
  end

  it "renders the edit class_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => class_details_path(@class_detail), :method => "post" do
      assert_select "input#class_detail_classname", :name => "class_detail[classname]"
    end
  end
end
