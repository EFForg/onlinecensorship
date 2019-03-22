require "rails_helper"

RSpec.feature "Admin takedowns" do
  let!(:takedown) { FactoryBot.create(:takedown, details: "TEST MESSAGE") }
  before {
    log_in_admin
    visit takedowns_path
  }

  describe "Index" do
    it "displays a table" do
      within("table") do
        expect(page).to have_content(takedown.name)
      end
    end

    it "supports CSV download" do
      click_on "CSV"
      expect(page).to have_content takedown.name
    end
  end

  describe "Show" do
    it "can view an individual takedown" do
      click_on "View"
      expect(page).to have_content(takedown.details)
    end
  end
end
