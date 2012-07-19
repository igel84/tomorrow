class CreateSubscribers < ActiveRecord::Migration
  def self.up
    create_table :subscribers do |t|
      t.string :last_name
      t.string :first_name
      t.string :sex
      t.string :email
      t.boolean :active, :default=>'true'

      t.timestamps
    end
  end

  def self.down
    drop_table :subscribers
  end
end
