require 'spec_helper'

describe User do
   before do
   	@user = User.new(name: "user", email: "user@example.com", password: "master", password_confirmation: "master")
   end

   subject { @user }

   it { should respond_to(:name) }
   it { should respond_to(:email) }
   it { should respond_to(:password) }
   it { should respond_to(:password_confirmation) }
   it { should respond_to(:password_digest) }
   it { should respond_to(:token) }
   it { should respond_to(:admin) }

   it { should be_valid }
   it { should_not be_admin }

  describe "accessible attributes" do
   	it "should not allow access password_digest" do
   		expect do 
   			User.new(password_digest: "myhash")
   		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
   	end

   	it "should not allow access token" do
   		expect do 
   			User.new(token: "mytoken")
   		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
   	end
  end

  describe "required attributes" do

  	describe "when name is empty" do
  		before { @user.name = "" }
  		it { should_not be_valid }
  	end

  	describe "when password is empty" do
  		before { @user.password = @user.password_confirmation = "" }
  		it { should_not be_valid }
  	end

  	describe "when token is empty" do
      before { @user.save }
      its(:token) { should_not be_blank }
    end

  end

  describe "authenticateion" do
  	before { @user.save }
  	let(:user_db) { User.find_by_name(@user.name) }

  	describe "with valid password" do
  		it { should == user_db.authenticate(@user.password) }
  	end

  	describe "with invalid password" do
  		it { should_not == user_db.authenticate("invalid_password") }
  	end

  end

  describe "user name should be unique" do
  	before do
  		@user.save
  		@new_user = User.new(name: @user.name, password: "password", password_confirmation: "password")
  	end
  	subject { @new_user }

  	it { should_not be_valid }
  end

  describe "password and password_confirmation should match" do
  	describe "correct confirmation" do
  		before { @user.password = @user.password_confirmation }
  		it { should be_valid }
  	end

  	describe "not correct confirmation" do
  		before { @user.password_confirmation = @user.password + "extra" }
  		it { should_not be_valid }
  	end
  end


end
