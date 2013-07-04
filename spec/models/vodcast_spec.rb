require 'spec_helper'

describe Vodcast do

	before do
    @vodcast = Vodcast.new(title: "Some video", desc: "description", link: "http://www.youtube.com/watch?v=yVzNrz1jJHU") 
  end

  subject { @vodcast }

  describe "convert link" do
  	before { @vodcast.save }
  	its(:link) { should == "http://www.youtube.com/embed/yVzNrz1jJHU?feature=player_detailpage" }  	
  end

  describe "convert url link" do
  	before do
  		@vodcast.link = "http://www.youtube.com/watch?feature=player_detailpage&v=yVzNrz1jJHU"
  		@vodcast.save 
  	end
  	its(:link) { should == "http://www.youtube.com/embed/yVzNrz1jJHU?feature=player_detailpage" }  	
  end
end
