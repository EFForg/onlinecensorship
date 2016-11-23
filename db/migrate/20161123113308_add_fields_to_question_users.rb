class AddFieldsToQuestionUsers < ActiveRecord::Migration
  def change
    add_column :question_users, :pgp_key, :string
    add_column :question_users, :communication_preference, :text
  end
end
