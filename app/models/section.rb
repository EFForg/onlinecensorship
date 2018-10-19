class Section < ApplicationRecord
  has_many :sub_sections
  belongs_to :web_page

  accepts_nested_attributes_for :sub_sections, :reject_if => :all_blank, allow_destroy: true
  validates :title, presence: true

  translates :title, :content
  attribute :title
  attribute :content
end
