class QuestionnairesController < ApplicationController
    load_and_authorize_resource

  # GET /questionnaires
  # GET /questionnaires.xml
  def index
    @questionnaires = Questionnaire.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questionnaires }
    end
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.xml
  def show
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @questionnaire }
    end
  end

  # GET /questionnaires/new
  # GET /questionnaires/new.xml
  def new
    @questionnaire = Questionnaire.new
    @quest = Quest.new
     5.times do
      question = @questionnaire.quests.build
      4.times { question.choices.build }
    end
    end
  # def new
  #     @questionnaire = Questionnaire.new
  #     @quest = Quest.new
  #     @choice = Choice.new
  #   
  #     respond_to do |format|
  #       format.html # new.html.erb
  #       format.xml  { render :xml => @questionnaire }
  #     end
  #   end

  # GET /questionnaires/1/edit
  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end

  # POST /questionnaires
  # POST /questionnaires.xml
  def create
    @questionnaire = Questionnaire.new(params[:questionnaire])
    @quest = Quest.new(params[:quest])
    @choice = Choice.new(params[:choice])

    respond_to do |format|
      if @questionnaire.save
        flash[:notice]="Questionnaire Name #{@questionnaire.questionnaireName} Created"
        format.html { redirect_to(:controller =>"questionnaires",:action =>"new") }
        #format.html { redirect_to(@questionnaire, :notice => 'Questionnaire was successfully created.') }
        format.xml  { render :xml => @questionnaire, :status => :created, :location => @questionnaire }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @questionnaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questionnaires/1
  # PUT /questionnaires/1.xml
  def update
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      if @questionnaire.update_attributes(params[:questionnaire])
        format.html { redirect_to(@questionnaire, :notice => 'Questionnaire was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @questionnaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.xml
  def destroy
    @questionnaire = Questionnaire.find(params[:id])

    @answers=Answer.where(:questionnaire_id==@questionnaire)
    @answers.each do |ans|
      ans.destroy
    end

    @lessonpage=LessonPage.where(:questionnaire_id==@questionnaire)
    @lessonpage.each do |lessonpage|
      lessonpage.destroy
    end
    @choice=Choice.find(:all)
    @quest = Quest.find(:all,:conditions=>{:questionnaire_id=>@questionnaire.id})
    @quest.each do |quest |

      @choice.each do |choice |
        if choice.quest_id==quest.id
          choice.destroy
        end
      end
      quest.destroy
    end


    @questionnaire.destroy

    respond_to do |format|
      format.html { redirect_to(questionnaires_url) }
      format.xml  { head :ok }
    end
  end
end
