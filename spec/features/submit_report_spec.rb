require 'rails_helper'

RSpec.feature 'Report submission' do
  before { create_required }

  it 'can be done' do
    visit root_path
    click_on 'Submit Report'
    select 'Facebook', from: :takedown_platform
    select 'Yes', from: :takedown_appealed
    fill_in :takedown_reason, with: 'NSFW'
    fill_in :takedown_name, with: 'Full Name'
    fill_in :takedown_email, with: 'example@example.com'
    fill_in :takedown_details, with: 'message'
    click_on 'submit your report'
    expect(page).to have_content(/Success/)
  end
  it 'properly displays errors' do
    visit root_path
    click_on 'Submit Report'
    click_on :submit
    expect(page).to have_content('This field is required')
  end
end
