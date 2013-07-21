require 'spec_helper'

describe SessionsController do

  let(:user) { create(:user) }

  describe "#create" do
    context "when it's successful" do
      it "must save to the session" do
        post :create, :session => { :email => user.email, :password => user.password }
        expect(session[:user_id]).to_not be_nil
      end

      it "should redirect to the user path" do
        post :create, :session => { :email => user.email, :password => user.password }
        response.should redirect_to user_path(user)
      end
    end

    context "when it's unsuccessful" do
      it "should not save anything to the session" do
        post :create, :session => { :email => "", :password => "" }
        expect(session[:user_id]).to be_nil
      end

      it "should redirect to sessions#new" do
        post :create, :session => { :email => "", :password => "" }
        response.should redirect_to(new_session_path)
      end
    end
  end

  describe "#new" do
    it "should render the new template" do
      get :new
      response.should render_template(:new)
    end
  end

  describe "delete" do
    let(:user) { create(:user) }

    before(:each) do
      post :create, :session => { :email => user.email, :password => user.password }
      log_in_user(user)
    end

    it "should clear the session" do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it "should redirect_to the root path" do
      delete :destroy
      redirect_to root_path
    end
  end


end
