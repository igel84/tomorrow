class Pokaz < ActiveRecord::Base
  belongs_to :page
  belongs_to :mesto
  
  def self.pokaz_of_date(d)
    @pokaz = []
    Pokaz.find(:all, :conditions => ["date=?", d]).each do |p|
      @pokaz << p #if @pages.find_all{ |p| p == pokaz.page }.size==0
    end
  end
  
  def hour
    if self.time
      self.time.split(/:/).first || '0'
    else
      '0'
    end
  end
  
  def min
    if self.time
      self.time.split(/:/)[1] || '0'
    else
      '0'
    end
  end
    
end
