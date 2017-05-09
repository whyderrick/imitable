FactoryGirl.define do
  factory :user do
    email "derrick@example.com"
    password "derrick"
  end

  factory :poem do
    user
    title "The Best Poem"
    status "Ready"
  end

  factory :submission do
    user
    title "New Submission"
    submitted_to "Magnificent Publication"
    status Submission::STATUSES.first
  end
end
