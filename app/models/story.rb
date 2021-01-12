# Story
#
# The admin can add stories
#
class Story < ApplicationRecord
  belongs_to :icon

  validates :title, :brief, presence: true

  translates :title, :brief, :content

  ransack_alias :searchable, translated_search_any(%i(title brief content))

  def photo(*args)
    icon.file(*args)
  end
end
