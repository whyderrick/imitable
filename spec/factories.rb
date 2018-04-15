FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "derrick"

    factory :user_with_submissions do
      transient do
        submission_count 2
      end

      after(:create) do |user, evaluator|
        create_list(:submission, evaluator.submission_count, user: user)
      end
    end
  end

  factory :poem do
    user
    sequence(:title) { |n| "Untitled ##{n}" }
    status "Ready"
  end

  factory :submission do
    user
    sequence(:title) { |n| "New Submission #{n}" }
    submitted_to "Magnificent Publication"
    status Submission::STATUSES.first
  end
end
