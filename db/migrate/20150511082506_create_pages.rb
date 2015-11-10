class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :social_media_platform_id

      t.timestamps
    end
  end
end
