FactoryBot.define do
  factory :icon do
    file_file_name 'test.jpg'
    file_content_type 'image/jpeg'
    file_updated_at Time.zone.now
    file_file_size 2048
    available true
  end
end
