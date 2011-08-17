class ClassDetail < ActiveRecord::Base
    has_many :lesson_classes
    has_many :student_details
    has_many :teacher_lessions
    validates_uniqueness_of :classname
end
