class ChangeStoriesFieldsTypeInStories < ActiveRecord::Migration
  def change
  	change_column :stories, :title, :string
  	change_column :stories, :brief, :text
  	change_column :stories, :content, :text
  	change_column :stories, :external_link, :string
  end
end