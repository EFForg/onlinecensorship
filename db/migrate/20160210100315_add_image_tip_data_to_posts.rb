class AddImageTipDataToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_link, :string
    add_column :posts, :image_author_name, :string
    add_column :posts, :image_author_link, :string
    add_column :posts, :cc_license, :string
  end
end
