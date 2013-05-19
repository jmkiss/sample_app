require 'spec_helper'

describe "Static pages" do

  let(:base_title) {"Ruby On Rails Tutorial Sample App"}

  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
    it "should have the title 'Home'" do 
    	visit '/static_pages/home'
    	page.should have_selector( "title", :text => "#{base_title} | Home")
    end
  end
  describe "help page" do 
  	it "should have the h1 'help'" do 
  		visit '/static_pages/help'
  		page.should have_selector('h1', :text => 'Help')
  	end 
  	it "should have the title 'Help'" do 
    	visit '/static_pages/help'
    	page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end 
  describe "about page" do
  	it "should have the h1 'about'" do 
  		visit '/static_pages/about'
  		page.should have_selector('h1', :text => 'About')
  	end
  	it "should have the title 'About'" do 
    	visit '/static_pages/about'
    	page.should have_selector('title', :text => "#{base_title} | About")
    end
  end
end