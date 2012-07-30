#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#Pokaz.all.each do |p|
#  if p.page
#    PageHref.where(page_id:p.page.id).destroy_all
#    PageHref.where(href_id:p.page.id).destroy_all
#    p.page.destroy 
#  end
#end

Mesto.destroy_all
Mesto.create(name:'ЦДХ')
Mesto.create(name:'Музеон')
Mesto.create(name:'DOME')

page = Page.find(3)
page.name = 'КИНОКАМПУС "ПАРТИЗАН"'
page.save