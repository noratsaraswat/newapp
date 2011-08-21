class Lesson < ActiveRecord::Base
  has_and_belongs_to_many :developers
  has_many :lesson_pages
  has_many :teacher_lessons
  has_many :lesson_classes
  has_many :student_lessons
  validates_uniqueness_of :lessonName
  validates(:lessonName, :presence => true)

end
