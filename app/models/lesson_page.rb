class LessonPage < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :content_info
  belongs_to :questionnaire
  validates_uniqueness_of :lesson_id,:scope => [:content_info_id, :questionnaire_id]
end
