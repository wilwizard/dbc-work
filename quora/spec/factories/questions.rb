FactoryGirl.define do
  factory :question do
    question "Is this a question"
    association :user, factory: :user
  end

  # factory :best_question_answer do
  #   question "Is this a question"
  #   association :user, factory: :user
  #   answer_id 
  # end
end
