class AddMultiSelectToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :multi_select, :boolean, default: false
  end
end
