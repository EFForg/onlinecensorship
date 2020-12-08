class PagesQuestion < ApplicationRecord
  ## DB relations
 	belongs_to :page
  belongs_to :question
end
