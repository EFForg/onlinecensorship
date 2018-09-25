# FurtherRead
#
# The admin can add posts in the section further read
#
class FurtherRead < ApplicationRecord
  ransack_alias :searchable, translated_search(%i(title author written_in))

  # Validation
  validates :title, :category ,:author ,:link, :presence => true

  translates :title, :author, :written_in
  attribute :title
  attribute :author
  attribute :written_in
end
