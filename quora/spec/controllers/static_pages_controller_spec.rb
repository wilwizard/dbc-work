require 'spec_helper'

describe StaticPagesController do

  describe "get #HOME" do
    it "should render the :home view" do
      get :home
      response.should render_template(:home)
    end
  end

  describe "get #ABOUT" do
    it "should render the :about view" do
      get :about
      response.should render_template(:about)
    end
  end

  describe "get #CONTACT" do
    it "should render the :contact view" do
      get :contact
      response.should render_template(:contact)
    end 
  end
end
