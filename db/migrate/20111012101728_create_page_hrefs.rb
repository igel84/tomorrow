class CreatePageHrefs < ActiveRecord::Migration
  def self.up
    create_table :page_hrefs do |t|
      t.integer :page_id
      t.integer :href_id
      t.boolean :img

      t.timestamps
    end
  end

  def self.down
    drop_table :page_hrefs
  end
end
