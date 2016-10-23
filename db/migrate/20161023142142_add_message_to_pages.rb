class AddMessageToPages < ActiveRecord::Migration
  def change
    add_column :pages, :message, :text
  end
end
