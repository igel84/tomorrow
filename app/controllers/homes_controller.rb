#encoding: utf-8
class HomesController < ApplicationController		
	layout :select_layout
	before_filter :authorize, :except => [:index, :show, :search, :rss, :kalend, :all, :rss, :language]
	#before_filter :get_news
	
	def index
	  render :layout => false
	end
	
	def show
	  #статьи новостей
	  @news = Page.find(:all, :conditions => ["parent_id=6"], :order => 'created_at DESC') #get_news
	  if (params[:id] == '6')
	    @pages = Page.find(:all, :conditions => ["parent_id=?", params[:id]], :order=>'created_at DESC')
	    render 'all'
	  else
	    @page = Page.find(params[:id])
	    render 'show'
    end
	end	
	
	def list
	end
	
	def new
    @curent_page = Page.find(params[:id])
    @page = Page.new
  end
  
  def edit
    @page = Page.find(params[:id])
    @curent_page = nil
    if @page.parent_id
      @curent_page = Page.find(@page.parent_id)
    else
      @curent_page = @page
    end
  end
  
  def update
    @page = Page.find(params[:page][:id])
    @page.update_attributes(params[:page])
    if (params[:hrefs])
      @hrefs = params[:hrefs][:href_id]
      #удаление ссылок которые не указаны в статье
      @page.page_hrefs.each do |href|
        if (@hrefs.find_all{ |id| id == href.href_id }.size == 0)
          PageHref.find(href.id).destroy
        end
      end
      @hrefs.each do |h|
        if (@page.page_hrefs.find_all{ |p| p.href_id == h }.size == 0)
          pageHref = PageHref.new( :page_id=>@page.id, :href_id=>h  )
          pageHref.save
        end
      end      
    end    
    redirect_to :list, :notice=>'страница успешно изменена'
  end
  
  def create
    @page = Page.new(params[:page])
    @page.save
    #при добавлении в новости отправляется почта
    if (@page.parent_id==6)
      Notifer.email_friend(@page.name,@page.body,'igel.yulian@gmail.com').deliver
    end
    #если передана ссылка
    if (params[:hrefs])
      @hrefs = params[:hrefs][:href_id]
      @hrefs.each do |h|
        pageHref = PageHref.new( :page_id=>@page.id, :href_id=>h  )
        pageHref.save
      end      
    end    
    redirect_to :list, :notice=>'страница успешно добавлена'
  end
	
	def all
    @pages = Page.find(:all, :conditions => ["parent_id=?", params[:id]])
  end
	
	def rss
	  #статьи новостей
    @pages = Page.find(:all, :conditions => {:parent_id => 6}, :order => 'created_at DESC', :limit => 10)
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
  
	def kalend
    @pages = Page.pokaz_of_date(params[:id])
    #@pages = Page.find(:all, :conditions => ["parent_id=5 and position=?", params[:id]])
    render 'all' 
  end
	
	def language
	  if cookies[:lang] == 'eng'
	    cookies.delete(:lang)
	    redirect_to :root
	  else
	    cookies[:lang] = 'eng'
	    redirect_to :action=>'show', :id=>110
    end    
  end
	
	private
	  def select_layout
      #if ['index'].include?(action_name)
      #  ''  
      if ['show', 'kalend', 'runok', 'all'].include?(action_name)
        'application'
      else
        'admin'
      end
  end
end
