class AddAppealPageToCmsPages < ActiveRecord::Migration[5.1]
  def change
    add_column :content_management_pages, :appeal_page, :boolean, :default => false

    reversible do |dir|
      dir.up do
        # have to deal with migrating existing appeal pages
        # the "how-to-appeal-X" string was previously hard-coded
        appeal_pages = exec_query("SELECT * FROM content_management_pages "\
                                  "WHERE page LIKE 'how-to-appeal-%'")
        execute("UPDATE content_management_pages SET appeal_page = TRUE "\
                "WHERE page LIKE 'how-to-appeal-%'")
        page_ids = appeal_pages.map { |page| page['id'] }
        pages = exec_query("SELECT * FROM content_management_page_translations "\
                           "WHERE content_management_page_id IN "\
                           "(#{page_ids.join(', ')})")

        pages.each do |page|
          # for an unknown reason, titles have "Appeal - " prepended to them
          # for arabic titles, the platform name is added
          # this cleans them up
          new_title = if page['locale'] == 'ar'
                        page['page_title'].gsub(/ (.+)/, "")
                      else
                        page['page_title'].gsub(/.+ - /, "")
                      end
          execute("UPDATE content_management_page_translations "\
                  "SET page_title = '#{new_title}' WHERE id = #{page['id']}")
        end
      end
    end
  end
end
