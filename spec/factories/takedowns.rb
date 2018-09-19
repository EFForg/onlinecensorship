FactoryBot.define do
  factory :takedown do
    name 'Alice Last'
    email 'example@example.com'
    platform 'facebook'
    details 'details ' * 50
    appealed true
    reason 'NSFW'
  end
end
