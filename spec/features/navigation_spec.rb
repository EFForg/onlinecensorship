require 'rails_helper'

RSpec.feature "Public Navigation" do
  before do
    FactoryBot.create(:home_field)
    visit '/'
  end

  it 'can go to home' do
    expect(page).not_to be_nil
  end

  it 'can go to what_we_do' do
    FactoryBot.create(:cms_page, page: 'what-we-do')
    click_on 'What we do'
    expect(page).not_to be_nil
  end

  it 'can go to who_we_are' do
    FactoryBot.create(:cms_page, page: 'who-we-are')
    click_on 'Who we are'
    expect(page).not_to be_nil
  end

  it 'can go to faqs' do
    click_on 'FAQs'
    expect(page).not_to be_nil
  end

  it 'can go to appeal' do
    FactoryBot.create(:cms_page, page: 'appeal')
    FactoryBot.create(:cms_page, page: 'how-to-appeal-facebook')
    FactoryBot.create(:cms_page, page: 'how-to-appeal-google')
    FactoryBot.create(:cms_page, page: 'how-to-appeal-twitter')
    FactoryBot.create(:cms_page, page: 'how-to-appeal-youtube')
    FactoryBot.create(:cms_page, page: 'how-to-appeal-instagram')
    FactoryBot.create(:cms_page, page: 'how-to-appeal-flickr')
    click_on 'How to Appeal'
    expect(page).not_to be_nil
  end

  it 'can go to further_readings' do
    click_on 'Further Readings'
    expect(page).not_to be_nil
  end

  it 'can go to news' do
    click_on 'News & Analysis'
    expect(page).not_to be_nil
  end
end
