require 'spec_helper'

describe "Vodcasts" do

	subject { page }
  
  describe "index" do

  	let(:vodcast) { FactoryGirl.create(:vodcast) }

  	before(:all) { 30.times { FactoryGirl.create(:vodcast) } }
		after(:all)  { Vodcast.delete_all }

		before { visit root_path }

    describe "vodcasts list" do      
      it { should have_selector('h3', text: 'Vodcast #1') }
      it { should have_selector('p',  text: 'Lorem ipsum') }
      it { should have_selector('iframe',  width: '640') }
      it { should have_selector('iframe',  height: '360') }
    end
  end
end
