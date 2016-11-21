class ChangeCaseStudyDefaultValue < ActiveRecord::Migration
  def change
  	change_column_default :question_users, :case_study, false
  end
end
