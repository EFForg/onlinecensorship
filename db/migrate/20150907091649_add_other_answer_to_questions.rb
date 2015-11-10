class AddOtherAnswerToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :other_answer, :boolean ,:default  => 0
  end
end