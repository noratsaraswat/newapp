class ClassDetailsController < ApplicationController
  # GET /class_details
   load_and_authorize_resource
  # GET /class_details.xml
  def index
    @class_details = ClassDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @class_details }
    end
  end

  # GET /class_details/1
  # GET /class_details/1.xml
  def show
    @class_detail = ClassDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @class_detail }
    end
  end

  # GET /class_details/new
  # GET /class_details/new.xml
  def new
    @class_detail = ClassDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @class_detail }
    end
  end

  # GET /class_details/1/edit
  def edit
    @class_detail = ClassDetail.find(params[:id])
  end

  # POST /class_details
  # POST /class_details.xml
  def create
    @class_detail = ClassDetail.new(params[:class_detail])

    respond_to do |format|
      if @class_detail.save
        flash[:notice]="class name #{@class_detail.classname} Created"
        format.html { redirect_to(:controller =>"admin_people",:action =>"index") }
        format.xml  { render :xml => @class_detail, :status => :created, :location => @class_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @class_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /class_details/1
  # PUT /class_details/1.xml
  def update
    @class_detail = ClassDetail.find(params[:id])

    respond_to do |format|
      if @class_detail.update_attributes(params[:class_detail])
        #format.html { redirect_to(@class_detail, :notice => 'Class detail was successfully updated.') }
        format.html { redirect_to(:controller =>"class_details",:action =>"index") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @class_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /class_details/1
  # DELETE /class_details/1.xml
  def destroy
    @class_detail = ClassDetail.find(params[:id])
    @class_detail.destroy

    respond_to do |format|
      format.html { redirect_to(class_details_url) }
      format.xml  { head :ok }
    end
  end
end
