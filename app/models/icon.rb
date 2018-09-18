class Icon < ApplicationRecord
  has_many :stories

  has_attached_file :file, styles: { thumb: '160x160#' }
  validates_attachment :file,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def show
    file(:thumb)
  end
end
