# FurtherRead
#
# The admin can add posts in the section further read
#
class FurtherRead < ApplicationRecord
  ransack_alias :searchable, translated_search_any(%i(title author written_in))

  # Validation
  validates :title, :category ,:author ,:link, :presence => true

  translates :title, :author, :written_in
end
