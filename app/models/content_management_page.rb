# ContentManagementPage
#
# The admin can manage and change the cms pages content from the backEnd
#
class ContentManagementPage < ApplicationRecord
  HARD_CODED_PAGES = %w(how-to-appeal privacy-policy what-we-do
    who-we-are).freeze

  ransack_alias :searchable, translated_search(%i(content page_title))

  # Validation
  validates :page_title, :content, :presence => true

  # abort destruction of hard-coded pages that wil break the site
  before_destroy :prevent, if: ->(p) { HARD_CODED_PAGES.include? p.page }

  before_save :style, if: ->(p) { p.appeal_page }

  translates :content, :brief, :page_title
  attribute :content
  attribute :brief
  attribute :page_title

  private

  def prevent
    throw :abort
  end

  def style
    c = content.gsub(/<\/?div[^>]*>/, '').split("<h2>")
    title = c.first == '' ? c.shift(2).join("<h2>") : ''
    c = c.map do |question|
      '<div class="appeal-question"><h2>' + question + '</div>'
    end.join('')
    self.content = title + c
  end
end
