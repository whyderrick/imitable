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
end
