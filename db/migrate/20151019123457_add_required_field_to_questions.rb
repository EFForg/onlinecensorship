class AddRequiredFieldToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :required_field, :boolean , :default => 1
  end
end