class ContentDevelopersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /content_developers
  # GET /content_developers.xml
  def index
    if current_user.role.name=='deve'
     redirect_to(:controller => "developers",:action =>"index")
    return
    end
    @content_developers = ContentDeveloper.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @content_developers }
    end
  end

  # GET /content_developers/1
  # GET /content_developers/1.xml
  def show
    #@content_developer = ContentDeveloper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content_developer }
    end
  end

  # GET /content_developers/new
  # GET /content_developers/new.xml
  def new
    #@content_developer = ContentDeveloper.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content_developer }
    end
  end

  # GET /content_developers/1/edit
  def edit
    #@content_developer = ContentDeveloper.find(params[:id])
  end

  # POST /content_developers
  # POST /content_developers.xml
  def create
    #@content_developer = ContentDeveloper.new(params[:content_developer])

    respond_to do |format|
      if @content_developer.save
        format.html { redirect_to(@content_developer, :notice => 'Content developer was successfully created.') }
        format.xml  { render :xml => @content_developer, :status => :created, :location => @content_developer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content_developer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /content_developers/1
  # PUT /content_developers/1.xml
  def update
    #@content_developer = ContentDeveloper.find(params[:id])

    respond_to do |format|
      if @content_developer.update_attributes(params[:content_developer])
        format.html { redirect_to(@content_developer, :notice => 'Content developer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content_developer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /content_developers/1
  # DELETE /content_developers/1.xml
  def destroy
    #@content_developer = ContentDeveloper.find(params[:id])
    @content_developer.destroy

    respond_to do |format|
      format.html { redirect_to(content_developers_url) }
      format.xml  { head :ok }
    end
  end
end
