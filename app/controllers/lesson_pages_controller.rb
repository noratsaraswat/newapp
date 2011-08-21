class LessonPagesController < ApplicationController
  # GET /lesson_pages
  # GET /lesson_pages.xml
   load_and_authorize_resource
  def index
    @lesson_pages = LessonPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lesson_pages }
    end
  end

  # GET /lesson_pages/1
  # GET /lesson_pages/1.xml
  def show
    @lesson_page = LessonPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lesson_page }
    end
  end

  # GET /lesson_pages/new
  # GET /lesson_pages/new.xml
  def new
    @lesson_page = LessonPage.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lesson_page }
    end
  end

  # GET /lesson_pages/1/edit
  def edit
    @lesson_page = LessonPage.find(params[:id])
  end

  # POST /lesson_pages
  # POST /lesson_pages.xml
  def create
    @lesson_page = LessonPage.new(params[:lesson_page])

    respond_to do |format|
      if @lesson_page.save
        #format.html { render :controller=>"lessons",:action => "new" }

        if @lesson_page.content_info
            flash[:notice]="Content Data #{@lesson_page.content_info.name} added to lesson #{@lesson_page.lesson.lessonName}"
         elsif @lesson_page.questionnaire
         flash[:notice]="Questionnaire Data #{@lesson_page.questionnaire.questionnaireName} added to lesson #{@lesson_page.lesson.lessonName}"
        end

         format.html { redirect_to(:controller =>"lessons",:action =>"new") }

        #format.html { redirect_to(@lesson_page, :notice => 'Lesson page was successfully created.') }
        format.xml  { render :xml => @lesson_page, :status => :created, :location => @lesson_page }
      else

       if @lesson_page.content_info_id
        format.html { render :action => "new" }
       end
       if @lesson_page.questionnaire_id
          #@lesson_page.content_info_id=""
         #format.html { render 'lesson_pages_questionnaire/new' }
         #format.html { redirect_to(:controller=>"lesson_pages_questionnaire",:action=>"new") }
         format.html { render :template=>'lesson_pages_questionnaire/new'}
       end
        format.xml  { render :xml => @lesson_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lesson_pages/1
  # PUT /lesson_pages/1.xml
  def update
    @lesson_page = LessonPage.find(params[:id])

    respond_to do |format|
      if @lesson_page.update_attributes(params[:lesson_page])
        format.html { redirect_to(@lesson_page, :notice => 'Lesson page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lesson_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_pages/1
  # DELETE /lesson_pages/1.xml
  def destroy
    @lesson_page = LessonPage.find(params[:id])
    @lesson_page.destroy

    respond_to do |format|
      format.html { redirect_to(lesson_pages_url) }
      format.xml  { head :ok }
    end
  end
end
