#encoding: utf-8
class PokazsController < ApplicationController		
  before_filter :authorize, :except => [:index, :show]
  
  def new
    @pokaz = Pokaz.new( :date => 0, :page_id => params[:id] )
    #respond_to do |format|
    #	format.js {render :layout=>false}
    #end
  end
  
  def create
    @pokaz = Pokaz.new( 
      :page_id => params[:pokaz][:page_id],
      :date => params[:pokaz][:date],
      :mesto_id => params[:pokaz][:mesto],
      :time => params[:pokaz][:hour]+":"+params[:pokaz][:min])
    @pokaz.save
  end
  
  def edit
    @pokaz = Pokaz.find(params[:id])    
  end
  
  def update
    @pokaz = Pokaz.find(params[:id]) 
    @pokaz.date = params[:pokaz][:date]
    @pokaz.mesto_id = params[:pokaz][:mesto]
    @pokaz.time = params[:pokaz][:hour]+":"+params[:pokaz][:min]
    @pokaz.save
  end
  
  def show
    @title = ''
    @pages = []    
    
    mesto = Mesto.find(params[:id])
    @title = mesto.name
    Pokaz.where(mesto_id: mesto.id).order('date').each do |pokaz|
      @pages << pokaz.page
    end
    @pages = @pages.uniq
  end
  
  def destroy
    @id = params[:id]
    @pokaz = Pokaz.find(@id).destroy
  end
  
end
