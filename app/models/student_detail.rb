class StudentDetail < ActiveRecord::Base
  belongs_to :class_detail
  belongs_to :user
end
