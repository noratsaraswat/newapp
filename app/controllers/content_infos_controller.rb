class ContentInfosController < ApplicationController
  # GET /content_infos
  # GET /content_infos.xml
   load_and_authorize_resource
  def index
    @content_infos = ContentInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @content_infos }
    end
  end

  # GET /content_infos/1
  # GET /content_infos/1.xml
  def show
    @content_info = ContentInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content_info }
    end
  end

  # GET /content_infos/new
  # GET /content_infos/new.xml
  def new
    @content_info = ContentInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content_info }
    end
  end

  # GET /content_infos/1/edit
  def edit
    @content_info = ContentInfo.find(params[:id])
  end

  # POST /content_infos
  # POST /content_infos.xml
  def create
   @content_info = ContentInfo.new(params[:content_info])
    respond_to do |format|
      if @content_info.save
        #format.html { redirect_to(@content_info, :notice => 'Content info was successfully created.') }
        format.html { redirect_to(:action=>"new",:controller=>"lessons") }
        format.xml  { render :xml => @content_info, :status => :created, :location => @content_info }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /content_infos/1
  # PUT /content_infos/1.xml
  def update
    @content_info = ContentInfo.find(params[:id])

    respond_to do |format|
      if @content_info.update_attributes(params[:content_info])
        format.html { redirect_to(@content_info, :notice => 'Content info was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content_info.errors, :status => :unprocessable_entity }
      end
    end
  end
  # DELETE /content_infos/1
  # DELETE /content_infos/1.xml
  def destroy
    @content_info = ContentInfo.find(params[:id])
    @content_info.destroy

    respond_to do |format|
      format.html { redirect_to(content_infos_url) }
      format.xml  { head :ok }
    end
  end
end
