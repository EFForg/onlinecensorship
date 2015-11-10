class PagesQuestion < ActiveRecord::Base

  ## DB relations
 	belongs_to :page
  belongs_to :question

end