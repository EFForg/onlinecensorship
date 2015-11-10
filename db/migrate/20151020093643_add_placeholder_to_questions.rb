class AddPlaceholderToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :placeholder, :string
  end
end