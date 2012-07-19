class AddMesto < ActiveRecord::Migration
  def self.up
    mesto = Mesto.new ( :name=>'Dome' )
    mesto.save
  end

  def self.down
  end
end
