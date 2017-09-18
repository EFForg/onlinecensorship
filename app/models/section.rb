class Section < ActiveRecord::Base
	has_many :sub_sections
	belongs_to :web_page

	accepts_nested_attributes_for :sub_sections, :reject_if => :all_blank, allow_destroy: true

	translates :title, :content
end
