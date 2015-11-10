class RemoveAttachmentFromPosts < ActiveRecord::Migration
  def change

  	if column_exists? :posts, :attachment_file_name
  		remove_column :posts, :attachment_file_name
		end

  	if column_exists? :posts, :attachment_content_type
  		remove_column :posts, :attachment_content_type
		end

  	if column_exists? :posts, :attachment_file_size
  		remove_column :posts, :attachment_file_size
		end

  	if column_exists? :posts, :attachment_updated_at
  		remove_column :posts, :attachment_updated_at
		end

  end
end