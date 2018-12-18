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

  context 'updating appeal page' do
    let!(:content) do
      <<~HTML
      <h2>Title</h2>
      <h2>1 Question</h2>
      <p>some content here</p>
      <p>another paragraph here</p>
      <h2>2 Another question</h2>
      <p>more content</p>
      HTML
    end
    it 'adds appeal-question divs surrounding h2s' do
      expected_content = <<~HTML
      <h2>Title</h2>
      <div class="appeal-question"><h2>1 Question</h2>
      <p>some content here</p>
      <p>another paragraph here</p>
      </div><div class="appeal-question"><h2>2 Another question</h2>
      <p>more content</p>
      HTML
      page = FactoryBot.build(:cms_page, content: content,
                                         appeal_page: true)
      page.save
      expect(page.content).to eq(expected_content + '</div>')
    end
    it 'does not duplicate the divs' do
      page = FactoryBot.create(:cms_page, content: content,
                                          appeal_page: true)
      expect { page.update(page_title: 'new title') }.not_to \
        change { page.reload.content }
    end
    it 'adds divs around new questions' do
      page = FactoryBot.create(:cms_page, content: content,
                                          appeal_page: true)
      new_content = <<~HTML
      <h2>3 New question</h2>
      <p>content</p>
      HTML
      page.update(content: page.content + new_content)
      expected_content = <<~HTML
      <h2>Title</h2>
      <div class="appeal-question"><h2>1 Question</h2>
      <p>some content here</p>
      <p>another paragraph here</p>
      </div><div class="appeal-question"><h2>2 Another question</h2>
      <p>more content</p>
      </div><div class="appeal-question"><h2>3 New question</h2>
      <p>content</p>
      HTML
      expect(page.reload.content).to eq(expected_content + '</div>')
    end
  end

  context 'updating non-appeal page' do
    it "doesn't modify content" do
      content = <<~HTML
      <h2>Title</h2>
      <h2>1 Question</h2>
      <p>some content here</p>
      <p>another paragraph here</p>
      <h2>2 Another question</h2>
      <p>more content</p>
      HTML
      page = FactoryBot.create(:cms_page, content: content)
      expect { page.update(page_title: 'new title') }.not_to \
        change { page.reload.content }
    end
  end
end
