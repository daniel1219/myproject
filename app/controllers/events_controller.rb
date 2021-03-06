class EventsController < ApplicationController

  before_filter :find_event, :only => [ :show, :edit, :update, :destroy]

 def index
      @events = Event.page( params[:page] ).per(3)
      
      respond_to do |format|
          format.html # index.html.erb
          format.json { render :json => @events.to_json }
          format.xml { render :xml => @events.to_xml }
          format.atom { @feed_title = "My event list" }
          # index.atom.builder
    end
 end
  
 def show
       respond_to do |format|
          format.html # index.html.erb
          format.json { render :json => @events.to_json }
          format.xml { render :xml => @events.to_xml }
     end
 end
  
 def new
   @event = Event.new
 end
  
 def create
     @event = Event.new(params[:event])
        if @event.save
        flash[:notice] = "aaa"
        redirect_to :action => :index
   else
      render :action => :new # use new
    end
  end
  
  def edit
  end
  
  def update
  
    if @event.update_attributes( params[:event] )
      flash[:notice] = "bbb"
       redirect_to :action => :index
     else
      render :action => :new
    end
  end
  
  def destroy
  @event.destroy
  
  flash[:alert] = "ccc"
  redirect_to :action => :index
  end

  protected

  def find_event
        @event = Event.find(params[:id])
   end

end
