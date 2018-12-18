require 'rails_helper'

RSpec.describe ContentManagementPage, type: :model do
  context 'deletion' do
    it 'cannot be deleted if it is hard-coded' do
      page = FactoryBot.create(:cms_page, page: 'how-to-appeal')
      expect(page.destroy).to be_falsey
    end
    it 'can be deleted' do
      page = FactoryBot.create(:cms_page)
      page.destroy
      expect { ContentManagementPage.find(page.id) }.to \
        raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
