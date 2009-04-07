class NotebookController < ApplicationController

  before_filter :login_required
  before_filter :user_info
  before_filter :notebooks_info

  before_filter :notebook_info, :except => [:index, :new, :create]

  layout 'main'

  def notebook_info 
    @notebook = Notebook.find(params[:id])
  end

  def index
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @notebook }
    end
  end
  
  def new
    @notebook = Notebook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @notebook }
    end
  end

  def create
    @notebook = Notebook.new(params[:notebook])
    @notebook.creator = @user

    respond_to do |format|
      if @notebook.save
        flash[:notice] = 'Notebook was successfully created.'
        format.html { redirect_to(@notebook) }
        format.xml  { render :xml => @notebook, :status => :created, :location => @notebook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notebook.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @notebook.update_attributes(params[:notebook])
        flash[:notice] = 'Panel was successfully updated.'
        format.html { redirect_to(@notebook) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notebook.errors, :status => :unprocessable_entity }
      end
    end    
  end

end
