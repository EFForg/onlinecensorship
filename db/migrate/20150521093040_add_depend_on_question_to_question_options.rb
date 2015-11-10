class AddDependOnQuestionToQuestionOptions < ActiveRecord::Migration
  def change
    add_column :question_options, :dependent_on_question_id, :integer
  end
end