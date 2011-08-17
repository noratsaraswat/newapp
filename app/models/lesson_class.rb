class LessonClass < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :class_detail
  validates_uniqueness_of :class_detail_id,:scope => [:lesson_id]
end
