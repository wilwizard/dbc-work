require 'spec_helper'

describe UsersController do

  describe "get #NEW" do
    
    it "should assign a new user as @new" do
      get :new
      assigns(:user).should be_an_instance_of(User)
    end
    
    it "should render the :new view" do
      get :new
      response.should render_template :new
    end
  end

  describe "get #SHOW" do

    let(:user) { create(:user) }

    it "should assign the requested user as user" do
      get :show, :id => user
      assigns(:user).should eq(user)
    end

    it "should render the show template" do
      get :show, :id => user
      response.should render_template :show
    end


  end

  describe "get #EDIT" do
    let(:user) { create(:user) }

    it "should assign the user to @user" do
      get :edit, :id => user
      assigns(:user).should eq user   
    end

    it "should render a edit user view" do
      get :edit, :id => user
      response.should render_template :edit
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      
      it "should create a new user" do
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      # it "should log the user in" do
      #   expect{post :create, user: attributes_for(:user)}.to change(session[:user_id]).from('').to(1)
      # end

      it "should redirect to the new user page" do
        post :create, user: attributes_for(:user)
        response.should redirect_to User.last
      end
    end

    context "with invalid attributes" do

      let!(:invalid_user) { build(:user, :email => "")}

      it "should not create a new user" do
        expect {
          post :create, user: invalid_user
        }.to_not change(User, :count)
      end

      it "should re render the new method" do
        post :create, user: invalid_user
        response.should render_template :new
      end
    end
  end

  describe "put UPDATE" do

    let(:user) { create(:user, :email => 'foo@baz.com' ) }
    context "with valid attributes" do

      it "should assign @user to the user" do
        put :update, id: user.id, user: attributes_for(:user, :email => 'new@email.com')
        user.reload
        user.email.should eq('new@email.com')
      end
      
      it "should redirect_to the user show page" do
        put :update, id: user.id, user: attributes_for(:user, :username => 'bazbok', :email => 'foo@baz.com')
        response.should redirect_to user_path(user)
      end
    end

    context "with invalid attributes" do
    end
  end

end
