class StudentLessonPageController < ApplicationController
  def index
  @studentlesson=StudentLesson.where(:user_id=>"#{current_user.id}")
  end
  def find
    @lessonclass=LessonClass.find(:first,:conditions=>{:unique_classid=>"#{params[:code]}"} )
    if @lessonclass
    #flash[:notice]="Lesson #{@teacherlesson.lesson.lessonName} Added to #{@teacherlesson.user.name}'s list "
    @instructer=User.find(:first,:conditions=>{:id=>"#{@lessonclass.teacherid}"})
    
      @studentdetails=StudentDetail.new
      @studentdetails.class_detail_id=@lessonclass.class_detail_id
      @studentdetails.user_id=current_user.id
      @studentdetails.save
    redirect_to(:action =>"result",:lessonname=>"#{@lessonclass.lesson.lessonName}",:classname=>"#{@lessonclass.class_detail.classname}",:instructer=>"#{@instructer.name}",:lessonid=>"#{@lessonclass.lesson.id}")
    else
      flash[:notice]="#{params[:code]} is not a valied code"
      redirect_to(:action =>"index")
    end
  end

  def result
    @studentlesson=StudentLesson.where(:user_id=>"#{current_user.id}")
    @lesson_name=params[:lessonname]
    @class_name=params[:classname]
    @instructer=params[:instructer]
    @lessonid=params[:lessonid]
  end
  def add
  @studentlesson=StudentLesson.new
  @studentlesson.user_id=current_user.id
  @studentlesson.lesson_id=params[:lessonid]
  @studentlesson.finished=0
  if @studentlesson.save
      #flash[:notice]="Class #{@lessonclass.class_detail.classname} Added to lesson #{@lessonclass.lesson.lessonName} Unique code is #{params[:code]}"
      redirect_to(:action =>"index")
     return
  else
    flash[:notice]="This lesson already added"
    redirect_to(:action =>"index")
  end
 end
  def remove
    @studentlesson=StudentLesson.find(params[:id])
    #flash[:notice]="Lesson #{@lessonclass.lesson.lessonName} removed from class #{@lessonclass.class_detail.classname}"
    @studentlesson.destroy
     redirect_to(:action =>"index")
  end
  def lesson
    @answer = Answer.new
    @lessonclass=LessonClass.find(:first,:conditions=>{:lesson_id=>"#{params[:lessonid]}"} )
    @studentlesson=StudentLesson.find(:first,:conditions=>{:lesson_id=>"#{params[:lessonid]}",:user_id=>"#{current_user.id}"} )
    @current=@studentlesson.finished
    @lessonclasslessonid=@lessonclass.lesson_id
    @lesson_name=@lessonclass.lesson.lessonName
    @classname=@lessonclass.class_detail.classname
    @classcode=@lessonclass.unique_classid
    @instructer=User.find(:first,:conditions=>{:id=>"#{@lessonclass.teacherid}"})
    @instructername=@instructer.name
    @lessonpages=LessonPage.find(:all,:conditions=>{:lesson_id=>"#{params[:lessonid]}"})
    @lessonpagesbrowse=@lessonpages
    @count=@lessonpages.size
    @questCount=0
    @lessonpages.each do | lesspage|
      if lesspage.questionnaire_id
        @questCount=@questCount+1
      end
    end
  end
  def teacherlesson
    @current=params[:current]
    @submitbutton=0
    @lessonclass=LessonClass.find(:first,:conditions=>{:lesson_id=>"#{params[:lessonid]}"} )
    @lessonclasslessonid=@lessonclass.lesson_id
    @lesson_name=@lessonclass.lesson.lessonName
    @classname=@lessonclass.class_detail.classname
    @classcode=@lessonclass.unique_classid
    @instructer=User.find(:first,:conditions=>{:id=>"#{@lessonclass.teacherid}"})
    @instructername=@instructer.name
    @lessonpages=LessonPage.find(:all,:conditions=>{:lesson_id=>"#{params[:lessonid]}"})
    @lessonpagesbrowse=@lessonpages
    @count=@lessonpages.size
    @questCount=0
    @lessonpages.each do | lesspage|
      if lesspage.questionnaire_id
        @questCount=@questCount+1
      end
    end
  end
  def nextlesson
    @lesson_id=params[:lessonid]
    @count=params[:count]
    @pass=params[:pass]
    #if @pass
    @current=params[:current]
    @val= Integer(@current)
    @val2= Integer(@count)
    @val2=@val2-1
    #@val2=@val2 # to adjust count and array value
    if @val<@val2
      @val=@val+1
    end
    #@j=@val+1
    @current=@val.to_s
    if @pass
    @studentlesson = StudentLesson.find(:first,:conditions=>{:lesson_id=>"#{@lesson_id}",:user_id=>"#{current_user.id}"})
    if @studentlesson
      @studentlesson.finished=@current
      @studentlesson.save
    end
    redirect_to(:action=>"lesson",:lessonid=>"#{@lesson_id}")
    else
    redirect_to(:action=>"teacherlesson",:lessonid=>"#{@lesson_id}",:current=>"#{@current}")
    end
   end
   def prevlesson
     @lesson_id=params[:lessonid]
     @pass=params[:pass]
    #if @pass
     @current=params[:current]
     @val= Integer(@current)
    if @val>0
      @val=@val-1
    end
    #@j=@val+1
    @current=@val.to_s
    if @pass
    @studentlesson = StudentLesson.find(:first,:conditions=>{:lesson_id=>"#{@lesson_id}",:user_id=>"#{current_user.id}"})
    if @studentlesson
      @studentlesson.finished=@current
      @studentlesson.save
    end
     redirect_to(:action=>"lesson",:lessonid=>"#{@lesson_id}")
     else
     redirect_to(:action=>"teacherlesson",:lessonid=>"#{@lesson_id}",:current=>"#{@current}")
     end
   end

   def answers
        @pass=false
        @ans=params[:ans]
        @answercheck=Answer.where(:questionnaire_id=>params[:questionnaire_id],:user_id=>current_user.id)

        if @ans and @answercheck.size==0
              @pass=true
              @ans.each do |answer |
                  @answer=Answer.new
                  @answer.choice_id=answer
                  @answer.user_id=current_user.id
                  @answer.questionnaire_id=params[:questionnaire_id]
                  @answer.save
              end
             questions=[]
             wrongans=[]
             @ans2=@ans
             @correct=0
             @ans.each do | answer|
               pass=0
               passtwo=0
               @choice=Choice.find(:first,:conditions=>{:id=>"#{Integer(answer)}"})
               @questionid=@choice.quest_id
               @choice=Choice.where(:quest_id=>"#{Integer(@questionid)}",:answer=>true)

                 #to check if user clicked more options than that of correct answer
               @wronganswers=Choice.where(:quest_id=>"#{Integer(@questionid)}",:answer=>false)
               #finished to check if user clicked more options than that of correct answer
               #to avoid second time same question evaluation
                num=0
               while num<= questions.size
                if questions[num]==Integer(@questionid)
                  pass=1
                   break
                end
               num=num+1
               end
                #to avoid second time same question evaluation
                #to avoid second time same question evaluation
                num=0
                while num<= wrongans.size
                if wrongans[num]==Integer(@questionid)
                  passtwo=1
                   break
                end
                num=num+1
               end
               #to avoid second time same question evaluation
               # For checking multiple correct answers for single question
               if pass==0
                     j=0
                     @choice.each do | cho|
                        @ans2.each do |ans|
                           if Integer(ans) ==Integer(cho.id)
                             j=j+1
                             questions.push(Integer(@questionid))
                          end
                        end
                    end
                    if j==@choice.size
                      @correct=@correct+1
                    end
                 end
              # For checking multiple correct answers for single question
              # to check if user clicked more options than that of correct answer
                    if passtwo==0
                     k=0
                      @wronganswers.each do | cho|
                        @ans2.each do |ans|
                          if Integer(ans) ==Integer(cho.id)
                             k=k+1
                            wrongans.push(Integer(@questionid))
                          end
                       end
                    end
                    if k>=1
                       if @correct >0 and j>0
                         @correct=@correct-1
                       end
                    end
                 end
               # to check if user clicked more options than that of correct answer
          end
    else
      flash[:notice]="Already answerd for this"
    end
  end

   def performance
        @correctanwerssize=0
        @lessonclass=LessonClass.find(:first,:conditions=>{:lesson_id=>"#{params[:lessonid]}",:class_detail_id=>"#{params[:classdetailsid]}"} )
        if @lessonclass
              @lessonclasslessonid=@lessonclass.lesson_id
              @lesson_name=@lessonclass.lesson.lessonName
              @classname=@lessonclass.class_detail.classname
              @classcode=@lessonclass.unique_classid
              @instructer=User.find(:first,:conditions=>{:id=>"#{@lessonclass.teacherid}"})
              @instructername=@instructer.name
              @classdetailsid=params[:classdetailsid]
              @lessonid=params[:lessonid]
              @studentdetails=StudentDetail.where(:class_detail_id=>"#{params[:classdetailsid]}")
              @lessonquestions=LessonPage.find_by_sql("select * from lesson_pages where lesson_id=#{@lessonclasslessonid} and questionnaire_id is not null")
        end
   end

   def export
     #FasterCSV.open("./file.csv", "w") do |csv|
     #end
     #redirect_to(:action=>"performance",:lessonid=>"#{params[:lesson_id]}",:classdetailsid=>"#{params[:class_detail_id]}")
    end
end