require 'rails_helper'

RSpec.feature 'Admin search' do
  before { log_in_admin }

  it 'displays results' do
    target = FactoryBot.create(:story, title: 'target')
    other = FactoryBot.create(:story, title: 'other')
    visit admin_stories_path
    fill_in 'q_searchable_cont', with: target.title
    click_on 'Search'
    expect(page).to have_content(target.title)
    expect(page).not_to have_content(other.title)
  end
end
