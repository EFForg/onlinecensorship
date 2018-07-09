FactoryBot.define do
  factory :user, aliases: %i(admin) do
    email 'admin@example.com'
    password 'password'
  end
end
