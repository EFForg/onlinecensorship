require 'rails_helper'

RSpec.describe Icon, type: :model do
  context 'deletion' do
    it 'is allowed when not in use' do
      icon = FactoryBot.create(:icon)
      icon.destroy
      expect { Icon.find(icon.id) }.to \
        raise_error(ActiveRecord::RecordNotFound)
    end
    it 'is aborted when still in use' do
      icon = FactoryBot.create(:icon)
      FactoryBot.create(:story, icon: icon)
      expect(icon.destroy).to be_falsey
    end
  end
end
