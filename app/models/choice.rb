class Choice < ActiveRecord::Base
  belongs_to :quest
  #validates_uniqueness_of :quest_id,:scope => [:answer]
  #validates_uniqueness_of :quest_id => [:ChoiceAnswers]
 #accepts_nested_attributes_for :quest

 end
