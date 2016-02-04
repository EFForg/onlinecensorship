class ChangeEmailFieldTypeInQuestionUsers < ActiveRecord::Migration
  def up
    change_column :question_users, :email, :text
  end

  def down
    change_column :question_users, :email, :string
  end
end
