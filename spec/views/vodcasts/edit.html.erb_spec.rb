require 'spec_helper'

describe "vodcasts/edit" do
  before(:each) do
    @vodcast = assign(:vodcast, stub_model(Vodcast,
      :link => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders the edit vodcast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vodcasts_path(@vodcast), :method => "post" do
      assert_select "input#vodcast_link", :name => "vodcast[link]"
      assert_select "textarea#vodcast_desc", :name => "vodcast[desc]"
    end
  end
end
