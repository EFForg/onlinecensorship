require 'rails_helper'

RSpec.feature 'Report submission' do
  before { create_required }

  describe "successful submission" do
    before do
      visit root_path
      click_on 'Submit Report'
      select 'Facebook', from: :takedown_platform
      select 'Yes', from: :takedown_appealed
      fill_in :takedown_reason, with: 'NSFW'
      fill_in :takedown_name, with: 'Full Name'
      fill_in :takedown_email, with: 'example@example.com'
      fill_in :takedown_details, with: 'message'
      click_on 'submit your report'
    end

    it "shows a success page" do
      expect(page).to have_content(/Thank you/)
      expect(Takedown.count).to eq(1)
    end

    it "supports e-mail confirmation" do
      expect(page).to have_content(/Thank you/)
      expect(Takedown.first.confirmed).to be false
      visit_confirmation_in_email
      expect(page).to have_content(/Thank you for confirming/)
      expect(Takedown.first.confirmed).to be true
    end
  end

  it 'properly displays errors' do
    visit root_path
    click_on 'Submit Report'
    click_on :submit
    expect(page).to have_content('This field is required')
  end
end

def visit_confirmation_in_email
  mail = ActionMailer::Base.deliveries.last
  urls = URI.extract(mail.body.raw_source)
  confirmation_url = urls.grep(/confirm/)[0]
  visit confirmation_url
end
