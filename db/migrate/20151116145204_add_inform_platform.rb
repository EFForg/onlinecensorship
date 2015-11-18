class AddInformPlatform < ActiveRecord::Migration
  def change
    add_column :question_users, :inform_platform, :boolean, :default => 0
  end
end