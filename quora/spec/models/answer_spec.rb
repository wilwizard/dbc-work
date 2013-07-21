require 'spec_helper'

describe Answer do

  before do
    @question = create(:question)
    @answer = create(:answer, :question_id => @question.id)
  end

  describe "accessible attributes" do
    it "should respond_to answer" do
      expect(@answer).to respond_to(:answer)
    end

    it "should respond_to user_id" do
      expect(@answer).to respond_to(:user_id)
    end

    it "should respond_to user" do
      expect(@answer).to respond_to(:user)
    end

    it "should respond_to question" do
      expect(@answer).to respond_to(:answer)
    end

    it "should respond to votes" do
      expect(@answer).to respond_to(:votes)
    end
  end
end
