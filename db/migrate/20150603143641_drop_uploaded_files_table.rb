class DropUploadedFilesTable < ActiveRecord::Migration  
	def up
		if table_exists?("uploaded_files")
    	drop_table :uploaded_files
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end