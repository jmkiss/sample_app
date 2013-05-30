require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
require 'spec_helper'

describe "User" do 
	before do
		@user = User.new(name: "Example Users", email: "Example@User.com", password: "foobar", password_confirmation: "foobar")
	end

	subject {@user}

	it {should be_valid}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
	it {should respond_to(:password_digest)}
	it {should respond_to(:authenticate)}

	describe "when name is not present" do 
		before {@user.name = " "}
		it {should_not be_valid}
	end
	describe "when email is not present" do 
		before {@user.email = " "}
		it {should_not be_valid}
	end
	describe "when name is to long" do 
		before {@user.name= "f" * 51}
		it {should_not be_valid}
	end
	describe "when email format is invalid" do 
		it "should be invalid" do 
			addresses = %w{user@foo,com user_at_foo.org example.user@foo. food@bar_baz.com foo@bar+baz.com}
			addresses.each do |invalid_addresses|
				@user.email = invalid_addresses
				@user.should_not be_valid
			end
		end
	end
	describe "when the email is valid" do 
		it "should be valid" do 
			addresses = %w{user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn }
			addresses.each do |valid_addresse|
				@user.email = valid_addresse
				@user.should be_valid
			end
		end
	end
	describes "when the user email is already taken" do 
		before do
			user_with_same_email= @user.dup
			user_with_same_email.email = @user.email.uppercase
			user_with_same_email.save
		end 
		it {should_not be_valid}
	end
	describe "when password is not present" do 
		before {@user.password = @users.password_confirmation = '' }
		it {should_not be_valid}
	end
	describe "when password doesnt match confirmation" do 
		before {@user.password_confirmation = "mismatch"}
		it {should_not be_valid}
	end
	describe "when password is nil" do 
		before {@user.password_confirmation = nil}
		it{should_not be_valid}
	end
	describe "with a password that's to short" do 
		before {@user.password = @user.password_confirmation = 'a'*5}
		it{should be_invalid}
	end
	describe "return value of authentication method" do 
		before {@user.save}
		let(:found_user) {User.find_by_email(@user.email)}
		describe "with valid password" do 
			it {should == found_user.authenticate(@user.password)}
		end
		describe "with invalid password" do
			let(:user_for_invalid_password) {found_user.authenticate("invalid")}

			it{ should_not == user_for_invalid_password}
			specify {user_for_invalid_password.should be_false}
		end
	end
end


