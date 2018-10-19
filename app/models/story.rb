# Story
#
# The admin can add stories
#
class Story < ApplicationRecord
  belongs_to :icon

  # Validation
  validates :title, :brief, :content, presence: true

  translates :title, :brief, :content
  attribute :title
  attribute :brief
  attribute :content

  ransack_alias :searchable, translated_search(%i(title brief content))

  def photo(*args)
    icon.file(*args)
  end
end
