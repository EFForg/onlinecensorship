class AddPdfToPosts < ActiveRecord::Migration
  def change
    add_attachment :posts, :pdf
  end
end
