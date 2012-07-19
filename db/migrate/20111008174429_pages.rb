class Pages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :permalink
      t.text :body
      t.text :body_html
      t.string :locale
      t.boolean :published
      t.integer :parent_id
      t.integer :position
      t.string :address
      t.timestamps
    end
    
    #1
    page = Page.new
    page.name='О фестивале'
    page.body=''
    page.save
    #2
    page = Page.new
    page.name='Программа'
    page.body=''
    page.save
    #3
    page = Page.new
    page.name='Кинофорум "проект на завтра"'
    page.body=''
    page.save
    #4
    page = Page.new
    page.name='События'
    page.body=''
    page.save
    #5
    page = Page.new
    page.name='Календарь'
    page.body=''
    page.save
    #нижние ссылки
    #6
    page = Page.new
    page.name='Новости'
    page.parent_id=4
    page.body=''
    page.save
    #7
    page = Page.new
    page.name='Тема фестиваля'
    page.body=''
    page.save
    #8
    page = Page.new
    page.name='Площадки фестиваля'
    page.body=''
    page.save
  end

  def self.down
    drop_table :pages
  end
end
