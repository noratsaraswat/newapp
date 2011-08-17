class QuestsController < ApplicationController
  load_and_authorize_resource
  # GET /quests
  # GET /quests.xml
  def index
    @quests = Quest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quests }
    end
  end

  # GET /quests/1
  # GET /quests/1.xml
  def show
    @quest = Quest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quest }
    end
  end

  # GET /quests/new
  # GET /quests/new.xml
  def new
    @quest = Quest.new
     # 4.times { @quest.choices.build }
    
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.xml  { render :xml => @quest }
    # end
  end

  # GET /quests/1/edit
  def edit
    @quest = Quest.find(params[:id])
  end

  # POST /quests
  # POST /quests.xml
  def create
    @quest = Quest.new(params[:quest])

    respond_to do |format|
      if @quest.save
        flash[:notice]="Question #{@quest.question} for Questionnaire #{@quest.questionnaire.questionnaireName} Created"
        format.html { redirect_to(:controller =>"questionnaires",:action =>"new") }
        #format.html { redirect_to(@quest, :notice => 'Quest was successfully created.') }
        format.xml  { render :xml => @quest, :status => :created, :location => @quest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quests/1
  # PUT /quests/1.xml
  def update
    params[:quest][:existing_choice_attributes] ||= {}
    @quest = Quest.find(params[:id])

    respond_to do |format|
      if @quest.update_attributes(params[:quest])
        format.html { redirect_to(:action=>"show",:controller=>"questionnaires",:id=>"#{@quest.questionnaire.id}") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quests/1
  # DELETE /quests/1.xml
  def destroy
    @quest = Quest.find(params[:id])
    @choices = Choice.find(:all,:conditions=>{:quest_id=>@quest.id})
    @choices.each do |choice |
      choice.destroy
    end
    @quest.destroy

    respond_to do |format|
      format.html { redirect_to(quests_url) }
      format.xml  { head :ok }
    end
  end
end
