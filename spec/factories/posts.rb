FactoryBot.define do
  factory :post do
    person
    category
    posts_themes { [FactoryBot.create(:theme)] }
    social_media_platforms { [FactoryBot.create(:social_media_platform)] }
    title 'Title'
    intro 'Intro'
  end
end
