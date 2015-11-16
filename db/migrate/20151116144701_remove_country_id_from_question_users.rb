class RemoveCountryIdFromQuestionUsers < ActiveRecord::Migration
  def change
  	if column_exists? :question_users, :country_id
  		remove_column :question_users, :country_id
		end  	

  	if column_exists? :question_users, :name
  		remove_column :question_users, :name
		end 
	end
end