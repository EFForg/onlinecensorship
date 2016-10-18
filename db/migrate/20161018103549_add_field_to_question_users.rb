class AddFieldToQuestionUsers < ActiveRecord::Migration
  def change
    add_column :question_users, :case_study, :boolean
  end
end
