require 'rails_helper'

RSpec.feature "Admin takedowns" do
  before { log_in_admin }
  it 'can view table' do
    takedown = FactoryBot.create(:takedown)
    click_on 'Takedown Reports'
    within('table') do
      expect(page).to have_content(takedown.name)
    end
  end
  it 'can view an individual takedown' do
    takedown = FactoryBot.create(:takedown, details: 'TEST MESSAGE')
    click_on 'Takedown Reports'
    click_on 'View'
    expect(page).to have_content(takedown.details)
  end
end
