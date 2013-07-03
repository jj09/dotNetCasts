require 'spec_helper'

describe "vodcasts/new" do
  before(:each) do
    assign(:vodcast, stub_model(Vodcast,
      :link => "MyString",
      :desc => "MyText"
    ).as_new_record)
  end

  it "renders new vodcast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vodcasts_path, :method => "post" do
      assert_select "input#vodcast_link", :name => "vodcast[link]"
      assert_select "textarea#vodcast_desc", :name => "vodcast[desc]"
    end
  end
end
