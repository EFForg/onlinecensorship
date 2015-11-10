class AddQuestionOptionToQuesions < ActiveRecord::Migration
  def change
    add_column :questions, :question_option, :integer
  end
end