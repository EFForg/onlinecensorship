class WebPage < ActiveRecord::Base
	has_many :sections

	extend FriendlyId
  friendly_id :title, use: :slugged

	accepts_nested_attributes_for :sections, :reject_if => :all_blank, allow_destroy: true

	translates :title, :brief, :content
end
