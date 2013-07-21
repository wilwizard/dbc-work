require 'spec_helper'
require 'application_controller'

describe QuestionsController do

  let!(:question) { create(:question) }
  let!(:user) { create(:user) }
  before(:each) do
    log_in_user(user)
  end

  describe "GET #index" do
    it "gets all the questions" do
      get :index
      assigns(:questions).should eq([question])
    end
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested question to @question" do
      get :show, id: question
      assigns(:question).should eq(question)
    end

    it "renders the #show view" do
      get :show, id: question
      response.should render_template :show
    end
  end

  describe "GET #new" do

    it "should assign a new question to @question" do
      get :new
      assigns(:question).should be_an_instance_of(Question)
    end
    it "renders the form for the question" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST create" do

    context "with valid attributes" do
      it "saves the question object to the database" do
        expect{
          post :create, question: attributes_for(:question)
        }.to change(Question, :count).by(1)
      end

      xit "redirects to the new question" do
        expect {
          post :create, question: attributes_for(:question)
        }.to redirect_to question_path(@question)
      end

    end
    context "with invalid attributes" do
      before(:each) do
        invalid_question = build(:question, :question => "")
      end
      it "should not save answer to database" do
        expect {
          post :create, invalid_question: attributes_for(:question) 
        }.to_not change(Question, :count).by(1)
      end
      it "should render the new form again" do
        post :create, invalid_answer: attributes_for(:answer)
        response.should render_template :new
      end
    end
  end
end
