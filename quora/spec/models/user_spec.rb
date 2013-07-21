require 'spec_helper'

describe User do
  
  let(:user) { create(:user) }
  let(:question) { create(:question) }

  describe "user attributes" do 
    it "should respond to name" do
      expect(user).to respond_to(:username)
    end

    it "should respond to password" do
      expect(user).to respond_to(:password)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to questions" do
      expect(user).to respond_to(:questions)
    end

    it "should respond to answers" do
      expect(user).to respond_to(:answers)
    end

    it "should respond to votes" do
      expect(user).to respond_to(:votes)
    end
  end

  describe "user validations" do

    it "should not allow a user to sign up without an email" do
      user_without_email =  build(:user, :email => "")
      expect(user_without_email).to_not be_valid
    end

    it "should not allow a user to sign up without a password" do
      user_without_password = build(:user, :password => "")
      expect(user_without_password).to_not be_valid
    end

    it "should not allow an invalid email" do
      user_with_invalid_email = build(:user, :email => "foojbil,com")
      expect(user_with_invalid_email).to_not be_valid
    end

    it "should allow users with valid emails" do
      user_with_valid_email = build(:user, :email => "baz@bok.com")
      expect(user_with_valid_email).to be_valid
    end

    it "should not allow an email address that is already taken" do
      user_with_same_email = user.dup
      expect(user_with_same_email).to_not be_valid
    end
  end

  describe "users emails should all be saved lowercase" do
    let(:mixed_case_email) { "FoO@BaR.cOM" }

    it "should save a user with lowercased emails" do
      mixed_case_user = build(:user, :email => mixed_case_email)
      mixed_case_user.save
      expect(mixed_case_user.reload.email).to eq(mixed_case_email.downcase)
    end
  end

  describe "voting" do
    let(:question) { user.questions.create(:question => "What is a cat?") }

    it "should increase the user's vote count" do
      expect{user.vote!(question, 1)}.to change(Vote, :count).by(1)
    end 
  end
end
