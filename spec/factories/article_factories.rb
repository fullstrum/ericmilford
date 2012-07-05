FactoryGirl.define do
  factory :article do
    sequence(:title) {|n| "Awesome Title #{n}"}
    abstract 'This article is about something awesome'
    content 'This article has some awesome content to read'

    ignore do
      tags_count 1
    end

    trait :published do
      published_at Time.now

      after(:build) do |article, evaluator|
        article.tags << create_list(:tag, evaluator.tags_count)
      end
    end

    trait :unpublished do
      published_at nil
    end
  end
end
