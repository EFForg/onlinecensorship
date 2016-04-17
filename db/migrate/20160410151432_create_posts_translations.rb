class CreatePostsTranslations < ActiveRecord::Migration
  def up
    Post.create_translation_table!({
      :title => :string,
      :description => :text,
      :intro => :text,
      :tags => :string,
      :side_image_caption => :string,
      :quote_author => :string,
      :quote_text => :text,
      :twitter_text => :text,
      :news_source => :string,
      :image_author_name => :string,
      :pdf_file_name => :string,
			:pdf_content_type => :string,
			:pdf_file_size => :string,
			:pdf_updated_at => :string
    }, {
      :migrate_data => true
    })
  end
  def down
  	Visual.drop_translation_table! :migrate_data => true
  end
end
