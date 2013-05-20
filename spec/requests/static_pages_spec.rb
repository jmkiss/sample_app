require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    before {visit root_path}

    it {page.should have_selector('h1', :text => 'Welcome To The Sample App')}
    it {page.should have_selector( "title", text: full_title(''))}
    it {page.should_not have_selector('title', :text => '| home')}
  end
  
  describe "help page" do 
    before {visit help_path}
  	it{page.should have_selector('h1', :text => 'Help')}
  	it{page.should have_selector('title', text: full_title('Help'))}
  end 
  
  describe "about page" do
    before {visit about_path}
  	it{page.should have_selector('h1', :text => 'About')}
  	it{page.should have_selector('title', text: full_title('About'))}
  end

  describe "contact page" do 
    before {visit contact_path}
    it{page.should have_selector('h1', :text => 'Contact')}
    it{page.should have_selector('title', text: full_title('Contact'))}
  end
end