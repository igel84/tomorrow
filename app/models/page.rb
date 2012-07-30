class Page < ActiveRecord::Base
  #after_create :send_mails
  #has_attached_file :photo
  image_url = "/system/:attachment/:id/:style/:basename.:extension"
  image_path = ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"

  has_attached_file :photo, url: image_url, path: image_path
  #,
  #  :styles => {
  #    :thumb=> "100x100#",
  #    :small  => "150x150>" }
  
  has_many :page_hrefs
  has_many :pokazs
  has_many :mestos, :through => :pokazs
  
  def self.children(id)
    Page.find(:all, :conditions => ["parent_id = ?", id])
  end
  
  def self.children_ru(id)
    Page.find(:all, :conditions => ["parent_id = ? AND (eng = ? OR eng IS NULL)", id, false])
  end

  def hrefs
    PageHref.find(:all, :conditions => ["page_id = ?", id])
  end
  
  def self.pokaz_of_date(d)
    @pages = [] #Pokaz.pokaz_of_date(d)
    Pokaz.pokaz_of_date(d).each do |pokaz|
      @pages << pokaz.page #if @pages.find_all{ |p| p == pokaz.page }.size==0
    end
    @pages.uniq
  end
  
end
