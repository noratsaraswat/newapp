class Questionnaire < ActiveRecord::Base
  has_many :lesson_pages
  has_many :quests, :dependent => :destroy
  validates_uniqueness_of :questionnaireName
  validates(:questionnaireName, :presence => true)
  
  accepts_nested_attributes_for :quests, :reject_if => lambda { |a| a[:question].blank? }, :allow_destroy => true
  
 end
