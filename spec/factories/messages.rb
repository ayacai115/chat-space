FactoryGirl.define do

  factory :message do
    body       { Faker::HarryPotter.quote }
    image      { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'images', 'brown_leaf.png'), 'image/png') }
    group_id   { |i| "Group#{ i }" }
    user_id    { |i| "User#{ i }" }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
