class TeacherLesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  belongs_to :classdetail
  validates_uniqueness_of :lesson_id,:scope => [:user_id]
end
