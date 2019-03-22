class Takedown < ApplicationRecord
  PLATFORMS = %w(facebook twitter youtube instagram tumblr flickr google+ other)

  include CSVing

  ransack_alias :searchable,
                translated_search(%i(platform details reason email name))

  has_many :images
  accepts_nested_attributes_for :images

  validates_presence_of %i(platform details reason),
                        message: 'This field is required'

  validates :appealed, inclusion: { in: [true, false], 
                                    message: 'This field is required' }

  validates :platform,
    inclusion: { in: PLATFORMS, message: "%{value} is not a platform "\
                 "we accept reports for." }

  before_save :create_token

  def create_token
    if token.blank?
      self.token = SecureRandom.urlsafe_base64.to_s
    end
  end

  def self.confirm(token)
    find_by(token: token).update_attribute(:confirmed, true)
  end
end
