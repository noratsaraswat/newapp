class StudentLesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  validates_uniqueness_of :user_id,:scope => [:lesson_id]
end
