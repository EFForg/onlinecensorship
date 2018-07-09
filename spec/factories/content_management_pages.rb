FactoryBot.define do
  factory :content_management_page, aliases: %i(cms_page) do
    page_title 'Title'
    content 'content'
    page 'name'
  end
end
