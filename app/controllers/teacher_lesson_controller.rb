class TeacherLessonController < ApplicationController
  def add
    @teacherlesson=TeacherLesson.new
    @teacherlesson.lesson_id=params[:id]
    @teacherlesson.user_id=current_user.id
    if @teacherlesson.save
      flash[:notice]="Lesson #{@teacherlesson.lesson.lessonName} Added to #{@teacherlesson.user.name}'s list "
      redirect_to(:controller=>"teacher_details",:action =>"index")
      return
    else
      flash[:notice]="Lesson #{@teacherlesson.lesson.lessonName} for #{@teacherlesson.user.name} already added "
      redirect_to(:controller=>"teacher_details",:action =>"index")
    end

  end

  def remove
    @teacherlesson=TeacherLesson.new
    @teacherlesson = TeacherLesson.find(params[:id])
    flash[:notice]="Lesson #{@teacherlesson.lesson.lessonName} deleted from #{@teacherlesson.user.name}'s list"
    @teacherlesson.destroy
     redirect_to(:controller=>"teacher_details",:action =>"index")
  end
end
