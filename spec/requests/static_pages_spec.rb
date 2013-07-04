require 'spec_helper'

describe "StaticPages" do

	subject { page }

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		page.should have_selector 'h1', text: 'About'
		click_link "Contact"
		page.should have_selector 'h1', text: 'Contact'
		click_link "Home"
		page.should_not have_selector 'h1', text: 'Contact'
		page.should_not have_selector 'h1', text: 'About'
		click_link "dotNetCasts"
		page.should_not have_selector 'h1', text: 'Contact'
		page.should_not have_selector 'h1', text: 'About'
	end

  describe "About page" do
  	before { visit about_path }

  	it { should have_selector('h1', text: 'About') }
	end

	describe "Contact page" do
		before { visit contact_path }

		it { should have_selector('h1', text: 'Contact') }
	end
end
