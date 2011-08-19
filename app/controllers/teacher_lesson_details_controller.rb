class TeacherLessonDetailsController < ApplicationController
 
  def index
    @value=params[:id]
    @lessonclass= LessonClass.find(:all,:conditions=>{:lesson_id=>@value})
    @lesson= LessonClass.find(:first,:conditions=>{:lesson_id=>@value})
    @classdetail=ClassDetail.find(:all)
   end
  def add
    @lessonclass=LessonClass.new
    #@id=params[:id]
    @id = params[:LessonClass][:class_detail_id]
    @lesson_id=params[:lesson_id]
    @code=params[:code]
    @classname=ClassDetail.find(@id)
    vall="#{@code}-#{@classname.classname}"
    @lessonclass.class_detail_id=@id
    @lessonclass.lesson_id=@lesson_id
    @lessonclass.unique_classid=vall
    @lessonclass.teacherid=params[:teacherid]
    if @lessonclass.save
      #flash[:notice]="Class #{@lessonclass.class_detail.classname} Added to lesson #{@lessonclass.lesson.lessonName} Unique code is #{params[:code]}"
      flash[:notice]="Unique ID for lesson #{@lessonclass.lesson.lessonName} for class #{@lessonclass.class_detail.classname} is #{vall} Please provide this to your students to add them selves to this  class"
    else
      flash[:notice]="Lesson #{@lessonclass.lesson.lessonName} for class #{@lessonclass.class_detail.classname} already added"
   end
   redirect_to(:controller =>"teacher_lesson_details",:action =>"index",:id=>"#{@lesson_id}")
  end
  def remove
    @lessonclass = LessonClass.find(params[:id])
    @lesson_id=@lessonclass.lesson.id
    #flash[:notice]="Lesson #{@lessonclass.lesson.lessonName} removed from class #{@lessonclass.class_detail.classname}"
    @lessonclass.destroy
     redirect_to(:controller=>"teacher_lesson_details",:action =>"index",:id=>"#{@lesson_id}")
  end
end