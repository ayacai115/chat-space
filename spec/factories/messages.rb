FactoryGirl.define do
  factory :message do
    body       { Faker::HarryPotter.quote }
    image      { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'images', 'brown_leaf.png'), 'image/png') }
    user_id    { |i| "User#{ i }" }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }

    association :group, factory: :group
    association :user, factory: :user
  end

  factory :invalid_message, class: Message do
    body nil
    association :group, factory: :group
    association :user, factory: :user
  end
end
