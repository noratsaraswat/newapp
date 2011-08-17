require 'spec_helper'

describe "class_details/new.html.erb" do
  before(:each) do
    assign(:class_detail, stub_model(ClassDetail,
      :classname => "MyString"
    ).as_new_record)
  end

  it "renders new class_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => class_details_path, :method => "post" do
      assert_select "input#class_detail_classname", :name => "class_detail[classname]"
    end
  end
end
