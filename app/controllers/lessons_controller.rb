class LessonsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /lessons
  # GET /lessons.xml
  def index
    @lessons = Lesson.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lessons }
    end
  end

  # GET /lessons/1
  # GET /lessons/1.xml
  def show
    @lesson = Lesson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lesson }
    end
  end

  # GET /lessons/new
  # GET /lessons/new.xml
  def new
    @lesson = Lesson.new
    @lesson_page = LessonPage.new
     respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lesson }
    end
  end

  # GET /lessons/1/edit
  def edit
    @lesson = Lesson.find(params[:id])
   end
  # POST /lessons
  # POST /lessons.xml
  def create
    @lesson = Lesson.new(params[:lesson])
    @lesson_page = LessonPage.new(params[:lesson_page])
    @developerslessons =DevelopersLessons.new
    @developer=Developer.new
    respond_to do |format|
      if @lesson.save
         @developer.lessonID=@lesson.id
         @developer.userid=current_user.id
         @developer.save
         @developerslessons.lesson_id=@lesson.id
         @developerslessons.developer_id=@developer.id
         @developerslessons.save
         #format.html { redirect_to(:controller =>"developers",:action =>"index") }
         flash[:notice]="Lesson Name #{@lesson.lessonName} Created"
         format.html { redirect_to(:controller =>"lessons",:action =>"new") }
         format.xml  { render :xml => @lesson, :status => :created, :location => @lesson }
       else
        format.html{ render :action => "new"}
        format.xml  { render :xml => @lesson.errors, :status => :unprocessable_entity }
      end
    end
  end
  # PUT /lessons/1
  # PUT /lessons/1.xml
  def update
    @lesson = Lesson.find(params[:id])
    respond_to do |format|
      if @lesson.update_attributes(params[:lesson])
        format.html { redirect_to(@lesson, :notice => 'Lesson was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lesson.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.xml
  def destroy
    @lesson = Lesson.find(params[:id])
    @developers=Developer.find(:all,:conditions=>{:lessonID=>@lesson.id})
    @developers.each do | developer |
      developer.destroy
    end
    @developerslessons =DevelopersLessons.find(:all,:conditions=>{:lesson_id=>@lesson.id})
    @developerslessons.each do | deve |
      deve.destroy
    end

    @lesson_page = LessonPage.find(:all,:conditions=>{:lesson_id=>@lesson.id})
    @lesson_page.each do |less |
      less.destroy
    end
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to(lessons_url) }
      format.xml  { head :ok }
    end
  end
end
