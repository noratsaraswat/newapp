class User < ActiveRecord::Base
   has_one :role
   has_many :teacher_lessons
   has_many :student_lessons
   has_many :student_details
   accepts_nested_attributes_for :role, :reject_if => :all_blank, :allow_destroy => true
   
   #validates_presence_of :name
   # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:name,:role_attributes
  validates_presence_of :role, :name
  # def role=(attrs_array)
  #   attrs_array.each do |attrs|
  #     role.create(attrs)
  #   end
  # end
  def with_role
    self.build_role 
    self
  end
 def role?(role)
    return !!self.role(role.to_s.camelize)
 end
 def method_missing(method_id, *args)
    if match = matches_dynamic_role_check?(method_id)
      tokenize_roles(match.captures.first).each do |check|
        return true if role.name.downcase == check
      end
      return false
    else
      super
    end
  end
 
  private
 
  def matches_dynamic_role_check?(method_id)
    /^is_an?_([a-zA-Z]\w*)\?$/.match(method_id.to_s)
  end
 
  def tokenize_roles(string_to_split)
    string_to_split.split(/_or_/)
  end
 
end
