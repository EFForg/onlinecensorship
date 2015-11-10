class AddOtherOptionAnswer < ActiveRecord::Migration
  def change	
	  add_column :question_answers, :other_option_answer, :string
  end
end