class AdminPeopleController < ApplicationController
  load_and_authorize_resource 
  # check_authorization 
  # before_filter :authenticate_user!
  # load_and_authorize_resource
  # GET /admin_people
  # GET /admin_people.xml
  def index
    @admin_people = AdminPerson.all
    # authorize! :index,@admin_people
    @role = Role.new
     @student_detail = StudentDetail.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_people }
    end
  end

  # GET /admin_people/1
  # GET /admin_people/1.xml
  def show
    #@admin_person = AdminPerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_person }
    end
  end

  # GET /admin_people/new
  # GET /admin_people/new.xml
  def new
    #@admin_person = AdminPerson.new
    #@role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_person }
    end
  end

  # GET /admin_people/1/edit
  def edit
    #@admin_person = AdminPerson.find(params[:id])
  end

  # POST /admin_people
  # POST /admin_people.xml
  def create
    #@admin_person = AdminPerson.new(params[:admin_person])
    #@role = Role.new(params[:role])

    respond_to do |format|
      if @admin_person.save
        format.html { redirect_to(@admin_person, :notice => 'Admin person was successfully created.') }
        format.xml  { render :xml => @admin_person, :status => :created, :location => @admin_person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_people/1
  # PUT /admin_people/1.xml
  def update
    #@admin_person = AdminPerson.find(params[:id])

    respond_to do |format|
      if @admin_person.update_attributes(params[:admin_person])
        format.html { redirect_to(@admin_person, :notice => 'Admin person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_people/1
  # DELETE /admin_people/1.xml
  def destroy
    #@admin_person = AdminPerson.find(params[:id])
    @admin_person.destroy

    respond_to do |format|
      format.html { redirect_to(admin_people_url) }
      format.xml  { head :ok }
    end
  end
end
