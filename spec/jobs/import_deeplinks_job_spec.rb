require 'rails_helper'
require 'rss'

RSpec.describe ImportDeeplinksJob, type: :job do
  before do
    FactoryBot.create(:category, title: 'Analysis')
    xml = file_fixture("deeplinks.xml").read
    feed = RSS::Parser.parse(xml).items
    allow_any_instance_of(described_class).to \
      receive(:feed).and_return(feed)
  end

  it 'creates posts from items in an rss feed' do
    expect{ described_class.perform_now }.to change { Post.count }.by(3)
  end

  it 'updates existing posts' do
    described_class.perform_now
    expect{ described_class.perform_now }.not_to change { Post.count }
  end
end
