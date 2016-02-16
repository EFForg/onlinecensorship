class AddContactToQuestionUsers < ActiveRecord::Migration
  def change
    if !column_exists? :question_users, :contact
      add_column :question_users, :contact, :boolean, :default => 1
    end
  end
end
