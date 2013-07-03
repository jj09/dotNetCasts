require 'spec_helper'

describe "vodcasts/index" do
  before(:each) do
    assign(:vodcasts, [
      stub_model(Vodcast,
        :link => "Link",
        :desc => "MyText"
      ),
      stub_model(Vodcast,
        :link => "Link",
        :desc => "MyText"
      )
    ])
  end

  it "renders a list of vodcasts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
