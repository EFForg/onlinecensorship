class CreateFurtherReads < ActiveRecord::Migration
  def change
    create_table :further_reads do |t|
      t.string :title
      t.text :content
      t.attachment :photo

      t.timestamps
    end
  end
end
