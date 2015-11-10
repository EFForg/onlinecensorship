class CreateQuestionUsers < ActiveRecord::Migration
  def change
    create_table :question_users do |t|
      t.integer :country_id
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
