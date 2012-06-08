FactoryGirl.define do
  factory :article do
    sequence(:title) {|n| "Awesome Title #{n}"}
    abstract 'This article is about something awesome'

    trait :published do
      published_at Time.now
    end

    trait :unpublished do
      published_at nil
    end
  end
end
