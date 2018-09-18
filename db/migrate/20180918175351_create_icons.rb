class CreateIcons < ActiveRecord::Migration[5.1]
  def change
    create_table :icons do |t|
      t.attachment :file, null: false
      t.boolean :available, null: false, default: true

      t.timestamps
    end

    add_reference :stories, :icon, index: true

    reversible do |dir|
      dir.up do
        stories = exec_query('SELECT * FROM stories')
        stories.each_with_index do |story, i|
          execute("INSERT INTO icons (id, file_file_name, file_content_type, "\
                  "file_file_size, available, file_updated_at, created_at, "\
                  "updated_at) VALUES (#{i}, '#{story['photo_file_name']}', "\
                  "'#{story['photo_content_type']}', "\
                  "#{story['photo_file_size']}, 0, NOW(), NOW(), NOW())")
          execute("UPDATE stories SET icon_id = #{i} WHERE id = #{story['id']}")
        end
        remove_attachment :stories, :photo
      end
      dir.down do
        add_attachment :stories, :photo
        stories = exec_query('SELECT * FROM stories')
        stories.each do |story|
          icon = exec_query("SELECT * FROM icons "\
                            "WHERE id = #{story['icon_id']}").to_hash[0]
          execute("UPDATE stories SET "\
                  "photo_file_name = '#{icon['file_file_name']}', "\
                  "photo_content_type = '#{icon['file_content_type']}', "\
                  "photo_file_size = #{icon['file_file_size']}, "\
                  "photo_updated_at = NOW() WHERE id = #{story['id']}")
        end
      end
    end
  end
end
