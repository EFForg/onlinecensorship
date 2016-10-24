class AddLanguageToQuestionUsers < ActiveRecord::Migration
  def change
    add_column :question_users, :language, :string
  end
end
