class AddTheorderToFurtherReads < ActiveRecord::Migration
  def change
    add_column :further_reads, :the_order, :integer
  end
end