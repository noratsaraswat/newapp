class StudentDetailsController < ApplicationController
    load_and_authorize_resource

  # GET /student_details
  # GET /student_details.xml
  def index
    @student_details = StudentDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_details }
    end
  end

  # GET /student_details/1
  # GET /student_details/1.xml
  def show
    @student_detail = StudentDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_detail }
    end
  end

  # GET /student_details/new
  # GET /student_details/new.xml
  def new
    @student_detail = StudentDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_detail }
    end
  end

  # GET /student_details/1/edit
  def edit
    @student_detail = StudentDetail.find(params[:id])
  end

  # POST /student_details
  # POST /student_details.xml
  def create
    @student_detail = StudentDetail.new(params[:student_detail])

    respond_to do |format|
      if @student_detail.save
        #format.html { redirect_to(@student_detail, :notice => 'Student detail was successfully created.') }
        flash[:notice]="Student #{@student_detail.user.name} assigned to class #{@student_detail.class_detail.classname}"
        format.html { redirect_to(:controller =>"admin_people",:action =>"index") }
        format.xml  { render :xml => @student_detail, :status => :created, :location => @student_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_details/1
  # PUT /student_details/1.xml
  def update
    @student_detail = StudentDetail.find(params[:id])

    respond_to do |format|
      if @student_detail.update_attributes(params[:student_detail])
        #format.html { redirect_to(@student_detail, :notice => 'Student detail was successfully updated.') }
        format.html { redirect_to(:action=>"index", :controller=>"student_details") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_details/1
  # DELETE /student_details/1.xml
  def destroy
    @student_detail = StudentDetail.find(params[:id])
    @student_detail.destroy

    respond_to do |format|
      format.html { redirect_to(student_details_url) }
      format.xml  { head :ok }
    end
  end
end
