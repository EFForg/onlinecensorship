class CreateQuestionUserSubmissions < ActiveRecord::Migration
  def change
    create_table :question_user_submissions do |t|
      t.integer :question_user_id
      t.integer :page_id

      t.timestamps
    end
  end
end
