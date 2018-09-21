class Image < ApplicationRecord
  belongs_to :takedown
  has_attached_file :file, path: '/:class/:attachment/:id_partition/:style'\
                                 '/:filename',
                           url: ':s3_domain_url'
  validates_attachment :file,
      content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
