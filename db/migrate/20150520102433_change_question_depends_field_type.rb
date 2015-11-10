class ChangeQuestionDependsFieldType < ActiveRecord::Migration

  def up
  	# change column name
  	rename_column :questions, :dependent_option_id, :dependent_on_question
    # change column type
    change_column :questions, :dependent_on_question, :boolean , :default => false
  end

  def down
    change_column :questions, :dependent_option_id, :integer
  end

end