FactoryGirl.define do
  factory :answer do
    answer "the spec is working"
    association :question, factory: :question
    association :user, factory: :user
  end
end
