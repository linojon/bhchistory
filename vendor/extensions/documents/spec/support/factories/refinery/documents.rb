
FactoryGirl.define do
  factory :document, :class => Refinery::Documents::Document do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

