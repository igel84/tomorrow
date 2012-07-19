class AddEngPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :eng, :boolean # Original filename
  end

  def self.down
    remove_column :pages, :eng
  end
end
