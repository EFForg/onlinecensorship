class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
      t.integer :question_id
      t.integer :next_page
      t.string :option_title

      t.timestamps
    end
  end
end
