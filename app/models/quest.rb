class Quest < ActiveRecord::Base
belongs_to :questionnaire
has_many :choices,:dependent => :destroy
validates_uniqueness_of :question
validates(:question,:presence=>true)
#validates_uniqueness_of :answer
#validates(:answer,:presence=>true)

accepts_nested_attributes_for :choices, :reject_if => lambda { |a| a[:ChoiceAnswers].blank? }, :allow_destroy => true
def choice_attributes=(choice_attributes)
  choice_attributes.each do |attributes|
    choices.build(attributes)
  end
end
def new_choice_attributes=(choice_attributes)
  choice_attributes.each do |attributes|
    choices.build(attributes)
  end
end
 attr_accessor :raise_exception
  
  after_save :raise_exception_if_needed
  def raise_exception_if_needed
    if @raise_exception.to_i == 1
      raise 'Oh noes!'
    end
  end

after_update :save_choices
def existing_choice_attributes=(choice_attributes)
   choices.reject(&:new_record?).each do |choice|
    attributes = choice_attributes[choice.id.to_s]
     if attributes
       choice.attributes = attributes
    else
        choices.delete(choice)
    end
   end
end
def save_choices
  choices.each do |choice|
    choice.save(false)
  end
end
    
    
def with_choices
    self.choices.build 
    self
  end
end
