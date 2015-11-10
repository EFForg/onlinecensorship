class AddCategoryIdToFurtherReads < ActiveRecord::Migration
  def change
    add_column :further_reads, :category, :string
    add_column :further_reads, :author, :string
    add_column :further_reads, :link, :string
    add_column :further_reads, :written_in, :string
    add_column :further_reads, :year, :integer
  end
end