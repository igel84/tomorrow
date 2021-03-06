class CreateMestos < ActiveRecord::Migration
  def self.up
    create_table :mestos do |t|
      t.string :name

      t.timestamps
    end
    
    mesto = Mesto.new ( :name=>'Ролан - Большой Зал' )
    mesto.save
    mesto = Mesto.new ( :name=>'Ролан - Малый Зал' )
    mesto.save
    mesto = Mesto.new ( :name=>'5 звезд' )
    mesto.save
    mesto = Mesto.new ( :name=>'Пионер - 1 зал' )
    mesto.save
    mesto = Mesto.new ( :name=>'Пионер - 2 зал' )
    mesto.save
    
  end

  def self.down
    drop_table :mestos
  end
end
