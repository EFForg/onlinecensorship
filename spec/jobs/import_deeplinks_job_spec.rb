require 'rails_helper'
require 'rss'

RSpec.describe ImportDeeplinksJob, type: :job do
  it 'creates posts from items in an rss feed' do
    FactoryBot.create(:category)
    xml = file_fixture("deeplinks.xml").read
    feed = RSS::Parser.parse(xml).items
    allow_any_instance_of(described_class).to \
      receive(:feed).and_return(feed)
    expect{ described_class.perform_now }.to \
      change { Post.count }.by(3)
  end
end
