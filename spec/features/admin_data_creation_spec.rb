require 'rails_helper'

RSpec.feature "Admin" do
  before { log_in_admin }

  it 'can log in' do
    expect(page).to have_content('Administration Panel')
  end

  it 'can create new stories' do
    icon = FactoryBot.create(:icon)
    click_on 'Manage Stories'
    click_on 'New Story'
    fill_in 'Title', with: 'Test title'
    choose option: icon.id
    fill_in 'Brief', with: 'brief story'
    fill_in 'Content', with: 'story content'
    click_on 'Create Story'
    visit '/'
    expect(page).to have_content('Test title')
  end

  it 'can create a post' do
    category = FactoryBot.create(:category)
    theme = FactoryBot.create(:theme)
    FactoryBot.create(:social_media_platform, title: 'Twitter')
    click_on 'Add New Post'
    select category.title, from: 'Category'
    check 'Twitter'
    check theme.title
    fill_in 'Title', with: 'Test Post Title'
    fill_in 'Intro', with: 'intro'
    check 'Publish the post'
    click_on 'Save Post'
    visit '/'
    click_on 'News & Analysis'
    expect(page).to have_content('Test Post Title')
  end
end
