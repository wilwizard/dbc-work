class Answer < ActiveRecord::Base
  attr_accessible :answer, :user_id, :question_id
  validates_presence_of :answer

  belongs_to :question
  belongs_to :user
  has_many :votes, as: :votable
end
