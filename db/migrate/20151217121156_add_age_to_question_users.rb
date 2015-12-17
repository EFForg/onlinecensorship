class AddAgeToQuestionUsers < ActiveRecord::Migration
  def change
    add_column :question_users, :age, :string
  end
end
