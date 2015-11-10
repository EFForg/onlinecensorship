class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :social_media_platform_id
      t.integer :page_id
      t.string :question_title
      t.string :question_type
      t.integer :dependent_option_id

      t.timestamps
    end
  end
end
