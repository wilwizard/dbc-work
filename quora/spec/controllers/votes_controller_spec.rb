require 'spec_helper'

describe VotesController do

  before(:each) do
    let!(:user) { create(:user) }
    let(:question) { create(:question, :user => user)}
    let(:answer) { create(:answer, :question => question)}
  end

  describe "post #CREATE" do
    context "when not logged in" do
      xit "should" do
        expect{post :create, vote: attributes_for(:vote)}
      end
    end
  end

end
