class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
     user ||= User.new # guest user (not logged in)

    if user.role.name=="admin"
        # can :manage, :Admin
        can :manage, [ContentDeveloper,ContentInfo,LessonPage,DevelopersLessons,Lesson,DevelopersLessons,Developer,AdminPerson,AdminPeopleLessons,Questionnaire,Quest,Role,Student,Teacher,ClassDetail]
      end
    if user.role.name=="student"
       can :manage, Student
       can :manage, StudentLesson
       can :read, StudentDetail
       can :manage, LessonClass
       # can :manage, Questionnaire
        can :manage, LessonPage
       # can :manage, ClassDetail
    end
    if user.role.name=="teacher"
       can :manage, Teacher
       can :manage, TeacherDetail
       can :manage, TeacherLesson
       can :manage, StudentDetail
       can :manage, Student
       can :manage, StudentLesson
       can :manage, ClassDetail
       can :read, ContentInfo
    end
    if user.role.name=="deve"
       can :manage, [ContentDeveloper,Lesson,DevelopersLessons,Developer,AdminPerson,AdminPeopleLessons,Questionnaire,Quest,Role,Student,Teacher]
    end
       
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
