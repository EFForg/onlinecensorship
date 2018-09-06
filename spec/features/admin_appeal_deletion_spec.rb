require 'rails_helper'

RSpec.feature 'Appeal page deletion', js: true do 
  before { log_in_admin }

  it 'can delete appeal pages' do
    page_title = 'DELETE ME'
    FactoryBot.create(:content_management_page, appeal_page: true,
                                                page_title: page_title)
    click_on 'CMS Pages'

    within 'li', text: 'CMS Pages' do
      click_on 'Manage'
    end

    td = find('td', text: page_title)
    tr = td.find(:xpath, './parent::tr')
    within tr do
      find("a[title='Delete']").click
    end

    expect(page).to have_content("#{page_title} successfully deleted")
  end
end
