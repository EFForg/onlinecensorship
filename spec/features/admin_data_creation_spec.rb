require 'rails_helper'

RSpec.feature "Admin" do
  before do
    FactoryBot.create(:home_field) # for home page loading
    log_in_admin
  end

  it 'can log in' do
    expect(page).to have_content('Administration Panel')
  end

  it 'can create new stories' do
    click_on 'Manage Stories'
    click_on 'New Story'
    attach_file('Thumbnail', Rails.root + 'spec/fixtures/eff.jpg')
    fill_in 'Title', with: 'Test title'
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

  def log_in_admin
    admin = FactoryBot.create(:admin)
    visit '/admin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: 'password'
    click_on 'Log in'
  end
end
