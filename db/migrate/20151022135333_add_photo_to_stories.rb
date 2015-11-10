class AddPhotoToStories < ActiveRecord::Migration
  def change
		add_attachment :stories, :photo
  end
end