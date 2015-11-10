class AddPersonIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :person_id, :integer
    add_column :posts, :quote_id, :integer
    add_column :posts, :publish_date, :date
    add_column :posts, :intro, :text
    add_column :posts, :tags, :string
    add_column :posts, :side_image_caption, :string
    add_attachment :posts, :side_image, :attachment
  end
end