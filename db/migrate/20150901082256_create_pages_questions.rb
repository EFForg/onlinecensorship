class CreatePagesQuestions < ActiveRecord::Migration
  def change
    create_table :pages_questions do |t|
      t.integer :question_id
      t.integer :page_id
      t.integer :dependent_on_question
      t.integer :question_option_id

      t.timestamps
    end
  end
end
