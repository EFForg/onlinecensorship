class AddConfirmationTokenToSubscribes < ActiveRecord::Migration
  def change
  	if !column_exists? :subscribes, :confirmation_token
    	add_column :subscribes, :confirmation_token, :string
    end

  	if !column_exists? :subscribes, :confirmed
    	add_column :subscribes, :confirmed, :boolean, :default => 0
  	end
  end
end