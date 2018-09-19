def create_required
  FactoryBot.create(:home_field) # for home page loading
end

def log_in_admin
  create_required
  admin = FactoryBot.create(:admin)
  visit '/admin'
  fill_in 'Email', with: admin.email
  fill_in 'Password', with: 'password'
  click_on 'Log in'
end
