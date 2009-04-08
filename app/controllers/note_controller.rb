class NoteController < ApplicationController

  before_filter :login_required
  before_filter :user_info
  before_filter :notebooks_info

  before_filter :notebook_info
  before_filter :note_info, :except => [:index, :new, :create]

  def notebook_info 
    @notebook = Notebook.find(params[:notebook_id])
  end

  def note_info 
    @note = Note.find(params[:id])
  end

  def show
    respond_to do |format|
      format.html { render :text => @note.display }# show.html.erb
      format.xml  { render :xml => @notebook }
    end
  end

  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
    end    
  end
  
  def create
    @note = Note.new(params[:note])
    @note.notebook = @notebook

    respond_to do |format|
      if @note.save
        flash[:notice] = 'Note was successfully created.'
        format.html { redirect_to :action => "show", :id => @note.id }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @note.update_attributes(params[:note])
        flash[:notice] = 'Panel was successfully updated.'
        format.html { redirect_to :action => "show", :id => @note.id}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end    
  end
  

end
