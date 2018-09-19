FactoryBot.define do
  factory :story do
    title 'A story'
    brief 'An intro'
    content 'content' * 50
    published true
    icon
  end
end
