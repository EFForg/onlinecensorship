class RemoveQuestionsTableFields < ActiveRecord::Migration
  def change
	  remove_column :questions, :social_media_platform_id
	  remove_column :questions, :page_id
	  remove_column :questions, :dependent_on_question
	  remove_column :questions, :question_option_id
  end
end