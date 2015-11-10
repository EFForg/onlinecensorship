class AddPromptTextToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :prompt_text, :string
    add_column :questions, :prompt_link, :string
  end
end