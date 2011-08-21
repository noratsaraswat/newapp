class RolesController < ApplicationController
  load_and_authorize_resource
  # GET /roles
  # GET /roles.xml
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roles }
    end
  end

  # GET /roles/1
  # GET /roles/1.xml
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @role }
    end
  end

  # GET /roles/new
  # GET /roles/new.xml
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /roles
  # POST /roles.xml
  def create
    @role = Role.new(params[:role])
     respond_to do |format|
      if @role.save
        flash[:notice]="Role #{@role.name} assigned to user #{@role.user.name}"
        format.html { redirect_to(:controller =>"admin_people",:action =>"index") }
        #format.html { redirect_to(@role, :notice => 'Role was successfully created.') }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.xml
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        #format.html { redirect_to(@role, :notice => 'Role was successfully updated.') }
        format.html { redirect_to(:controller =>"roles",:action =>"index") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.xml
  def destroy
    @role = Role.find(params[:id])
    unless @role.user_id==1
    @user=User.find(@role.user_id)
    # deleting the link between lesson and user
    @developers=Developer.find(:all,:conditions=>{:userid=>@role.user_id})

      @developers.each do |devel |
        devel.destroy
      end
    @role.destroy
    @user.destroy
    else
     flash[:notice]="Can't delete This Administrator Account"
    end

    respond_to do |format|
      format.html { redirect_to(roles_url) }
      format.xml  { head :ok }
    end
  end
end
