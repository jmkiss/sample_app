require 'spec_helper'

describe "User pages" do 
	subject {page}

	describe "signup page" do 
		before {visit signup_path}
		let(:submit){"Create My Account"}

		describe "with invalid information" do 
			it "should not have a user" do 
				expect{ click_button submit }.not_to change(User, count:)
			end
		end
		describe "with valid information" do 
			before do 
				fill_in "Name" with: "Example User"
				fill_in "Email" with: "Example@User.com"
				fill_in "Password" with: "foobar"
				fill_in "Confirmation" with: "foobar"
			end
			it "should create a new user" do 
				expect{ click_button submit}.to change(User, :count).by(1)
			end
		end
	end 
	describe "Profile page" do 
		let(:user) {FactoryGirl.create(:user)}
		before { visit user_path(user)}

		it {should have_selector('h1', text: user.name)}
		it {should have_selector('title', text: user.name)}
	end
end 
