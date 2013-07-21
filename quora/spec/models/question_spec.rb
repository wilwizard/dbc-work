require 'spec_helper'


describe Question do

  let(:user) { create(:user) }
  let(:question) { user.questions.create(:question => "Is this a dog?")}
  

  describe "accessible attributes" do
    it "should respond_to(:question)" do
      expect(question).to respond_to(:question)
    end

    it "should respond_to answers" do
      expect(question).to respond_to(:answers)
    end

    it "should respond_to votes" do
      expect(question).to respond_to(:votes)
    end
  end

  describe "valid question" do
    it "should not be blank" do
      question_without_text = build(:question, :question => "")
      expect(question_without_text).to_not be_valid
    end

    it "should have an owner" do
      question_without_user = build(:question, :user_id => "")
      expect(question_without_user).to_not be_valid
    end
  end

  describe "best answer" do
    let(:answer) { question.answers.create(:answer => "Yup it's a german shephard")}

    it "should set the best answer" do
      question.best_answer=(answer)
      question.answer_id.should == answer.id
    end

    it "should respond to best answer" do
      question.answer_id = answer.id
      question.best_answer.should == answer
    end
  end

  describe "sorted answers" do
    let(:answer) { question.answers.create(:answer => "Yup it's a german shephard")}
    let(:answer_2) {question.answers.create(:answer => "Yup it's a chihuahua") }
    let(:answer_3) {question.answers.create(:answer => "Yup it's a beagle")}
    before do 
      question.best_answer=(answer)
    end    

    it "should return an array of all answers" do
      question.sorted_answers.should be_an(Array)
    end

    it "should return an array with the best answer first" do
      question.sorted_answers.first.should == answer
    end
  end

  describe "class methods" do
    let(:question_2) { create(:question) }
    let(:question_3) { create(:question) }
    let(:question_4) { create(:question) }

    before(:each) do
      question_2.score = 1
      question.score = 10
      question_3.score = 5
      question_4.score = 2
    end

    describe "self#highest rated" do
      xit "should return an array" do
        Question.highest_rated.should be_an(Array)
      end

      xit "should return an array that's sorted by score" do
        Question.highest_rated.first.should == question
      end
    end

    describe "self#votes/time" do
      xit "should assign a time_range" do
        assigns(time_range).should == (Time.now - 1.hour)..Time.now
      end

      xit "should find all votes for the question that were created with the time range" do
      end
    end

    describe "self#trending" do
      xit "should return an array" do
        Question.trending.should be_an(Array)
      end

      xit "should return an array that's sorted by votes/time" do
      end
    end
  end
end
