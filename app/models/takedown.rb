class Takedown < ApplicationRecord
  PLATFORMS = %w(facebook twitter youtube instagram)

  extend Search

  has_many :images
  accepts_nested_attributes_for :images

  validates_presence_of %i(platform details reason),
                        message: 'This field is required'

  validates :appealed, inclusion: { in: [true, false], 
                                    message: 'This field is required' }

  validates :platform,
    inclusion: { in: PLATFORMS, message: "%{value} is not a platform "\
                 "we accept reports for." }
end
