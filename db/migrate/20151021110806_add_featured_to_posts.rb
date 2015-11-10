class AddFeaturedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :featured, :boolean ,:default => 0
    add_column :posts, :side_image_link, :string
  end
end