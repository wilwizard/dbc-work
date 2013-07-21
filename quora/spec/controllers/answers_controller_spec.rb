require 'spec_helper'

describe AnswersController do
  let!(:question) { create(:question) }
  let(:answer) { create(:answer, :question_id => question.id) }

  describe "GET #index" do
    
    xit "gets all the answers" do
      get :index, :question_id => question.id
      assigns(:answers).should eq([answer])
    end

    xit "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    
    xit "gets answer according to id" do
      get :show, question_id: question.id, id: answer.id
      assigns(:answer).should eq(answer)
    end

    xit "renders the answer show template" do
      get :show, id: answer
      response.should render_template :show
    end
  end

  describe "GET #new" do
    xit "assigns new answer to @answer" do
      get :new
      assigns(:answer).should be_an_instance_of(Answer)
    end
    xit "renders the form view" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    
    context "with valid attributes" do
      
      xit "should save answer to database" do
        expect {
          post :create, answer: attributes_for(:answer) 
        }.to change(Answer, :count).by(1)
      end
      
      xit "should redirect to answer show profile" do
        post :create, answer: attributes_for(:answer)
        response.should render_template :show
      end
    end

    context "with invalid attributes" do
      
      xit "should not save answer to database" do
        invalid_answer = build(:answer, :answer => "")
        expect {
          post :create, invalid_answer: attributes_for(:answer) 
        }.to_not change(Answer, :count).by(1)
      end
      
      xit "should render the new form again" do
        invalid_answer = build(:answer, :answer => "")
        post :create, invalid_answer: attributes_for(:answer)
        response.should render_template :new
      end
    end
  end
end
