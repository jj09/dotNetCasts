require 'spec_helper'

describe "vodcasts/show" do
  before(:each) do
    @vodcast = assign(:vodcast, stub_model(Vodcast,
      :link => "Link",
      :desc => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Link/)
    rendered.should match(/MyText/)
  end
end
