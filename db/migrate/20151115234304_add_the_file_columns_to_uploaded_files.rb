class AddTheFileColumnsToUploadedFiles < ActiveRecord::Migration
  def change
    add_attachment :uploaded_files, :the_file
  end
end
