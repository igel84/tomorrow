class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  helper_method :authorize
  helper_method :admin?
  helper_method :kalend?
  helper_method :eng?
  
  def authorize
    unless admin?
      redirect_to :root #'/admin/authentifications?return_to=' + request.request_uri
    end
  end
  
  def admin?
    cookies['admin'] == 'true'
  end
  
  def kalend? date
    #pages = Page.find(:all, :conditions => ["parent_id=5 and position=?", date])        
    #pages != []
    Pokaz.find(:all, :conditions => ["date=?", date]) != []
  end
  
  def eng?
    !cookies[:lang].nil?
  end
end
