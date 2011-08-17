class Answer < ActiveRecord::Base
  validates_uniqueness_of :user_id,:scope => [:questionnaire_id]
end
