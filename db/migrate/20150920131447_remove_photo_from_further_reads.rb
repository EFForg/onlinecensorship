class RemovePhotoFromFurtherReads < ActiveRecord::Migration
  def change

  	if column_exists? :further_reads, :content
  		remove_column :further_reads, :content
		end

  	if column_exists? :further_reads, :photo_file_name
  		remove_column :further_reads, :photo_file_name
		end

  	if column_exists? :further_reads, :photo_content_type
  		remove_column :further_reads, :photo_content_type
		end

  	if column_exists? :further_reads, :photo_file_size
  		remove_column :further_reads, :photo_file_size
		end

  	if column_exists? :further_reads, :photo_updated_at
  		remove_column :further_reads, :photo_updated_at
		end

  end
end
