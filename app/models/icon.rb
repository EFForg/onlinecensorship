class Icon < ApplicationRecord
  has_many :stories

  has_attached_file :file, styles: { thumb: '160x160#' }
  validates_attachment :file,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  before_destroy :check_stories

  def show
    file(:thumb)
  end

  private

  def check_stories
    return if Story.where(icon_id: id).empty?
    throw(:abort)
  end
end
