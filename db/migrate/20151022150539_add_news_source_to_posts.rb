class AddNewsSourceToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :news_source, :string
  end
end