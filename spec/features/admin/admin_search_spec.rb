require 'rails_helper'

RSpec.feature 'Admin search' do
  before { log_in_admin }

  it 'displays results of translated models' do
    target = FactoryBot.create(:story, title: 'target')
    other = FactoryBot.create(:story, title: 'other')
    visit admin_stories_path
    fill_in 'q_searchable_cont', with: target.title
    click_on 'Search'
    expect(page).to have_content(target.title)
    expect(page).not_to have_content(other.title)
  end

  it 'displays results of untranslated models' do
    target = FactoryBot.create(:takedown, name: 'target')
    other = FactoryBot.create(:takedown, name: 'other')
    visit takedowns_path
    fill_in 'q_searchable_cont', with: target.name
    click_on 'Search'
    expect(page).to have_content(target.name)
    expect(page).not_to have_content(other.name)
  end
end
