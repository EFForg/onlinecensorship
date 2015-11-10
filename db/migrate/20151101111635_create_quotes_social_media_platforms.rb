class CreateQuotesSocialMediaPlatforms < ActiveRecord::Migration
  def change
    create_table :quotes_social_media_platforms do |t|
      t.integer :quote_id
      t.integer :social_media_platform_id

      t.timestamps
    end
  end
end