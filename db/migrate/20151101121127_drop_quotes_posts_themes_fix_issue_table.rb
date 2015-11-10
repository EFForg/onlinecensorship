class DropQuotesPostsThemesFixIssueTable < ActiveRecord::Migration
  def up
		if table_exists?("quotes_posts_themes")
  		drop_table :quotes_posts_themes
	  end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end