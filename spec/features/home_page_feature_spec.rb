require 'rails_helper'

RSpec.feature "Home Page" do
  it 'loads' do
    FactoryBot.create(:home_field)
    visit '/'
    expect(page).not_to be_nil
  end
end
