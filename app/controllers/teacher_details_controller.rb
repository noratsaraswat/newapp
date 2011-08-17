class TeacherDetailsController < ApplicationController
  load_and_authorize_resource
  # GET /teacher_details
  # GET /teacher_details.xml
  def index
    @teacher_details = TeacherDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @teacher_details }
    end
  end

  # GET /teacher_details/1
  # GET /teacher_details/1.xml
  def show
    @teacher_detail = TeacherDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @teacher_detail }
    end
  end

  # GET /teacher_details/new
  # GET /teacher_details/new.xml
  def new
    @teacher_detail = TeacherDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @teacher_detail }
    end
  end

  # GET /teacher_details/1/edit
  def edit
    @teacher_detail = TeacherDetail.find(params[:id])
  end

  # POST /teacher_details
  # POST /teacher_details.xml
  def create
    @teacher_detail = TeacherDetail.new(params[:teacher_detail])

    respond_to do |format|
      if @teacher_detail.save
        format.html { redirect_to(@teacher_detail,:notice => 'Teacher detail was successfully created.') }
        format.xml  { render :xml => @teacher_detail, :status => :created, :location => @teacher_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @teacher_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teacher_details/1
  # PUT /teacher_details/1.xml
  def update
    @teacher_detail = TeacherDetail.find(params[:id])

    respond_to do |format|
      if @teacher_detail.update_attributes(params[:teacher_detail])
        format.html { redirect_to(@teacher_detail, :notice => 'Teacher detail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @teacher_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_details/1
  # DELETE /teacher_details/1.xml
  def destroy
    @teacher_detail = TeacherDetail.find(params[:id])
    @teacher_detail.destroy

    respond_to do |format|
      format.html { redirect_to(teacher_details_url) }
      format.xml  { head :ok }
    end
  end
end
