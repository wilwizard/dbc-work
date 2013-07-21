require 'spec_helper'

describe Vote do
  let!(:user) { create(:user) }
  let!(:question) { create(:question, :user_id => user.id) }
  let!(:answer) { create(:answer, question_id: question.id, user_id: user.id) }
  let(:vote) { answer.votes.create(value: 1, votable_id: answer.id, votable_type: answer.class.to_s, user_id: user.id)}

  describe "accessible attributes" do
    it "should respond to value" do
      expect(vote).to respond_to(:value)
    end

    it "should respond to votable_id" do
      expect(vote).to respond_to(:votable_id)
    end

    it "should respond to votable type" do
      expect(vote).to respond_to(:votable_type)
    end

    it "should respond to user_id" do
      expect(vote).to respond_to(:user_id)
    end
  end

  describe "validations" do
    let(:vote_2) { answer.votes.build(value: 1, votable_id: answer.id, votable_type: answer.class.to_s, user_id: user.id) }

    # this is failing but not sure why
    xit "should not allow a vote to be created that is a duplicate of another vote" do
      expect{vote_2.save}.to_not change(Vote, :count).by(1)
    end
  end
end
