class CreatePlatformLinks < ActiveRecord::Migration
  def change
    create_table :platform_links do |t|
      t.string :platform_name
      t.string :support_link
      t.string :help_link

      t.timestamps
    end
  end
end
