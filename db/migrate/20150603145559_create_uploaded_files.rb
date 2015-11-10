class CreateUploadedFiles < ActiveRecord::Migration
  def change
    create_table :uploaded_files do |t|
      t.string :title
      t.integer :question_answer_id

      t.timestamps
    end
  end
end
