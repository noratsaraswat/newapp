class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :mailer_set_url_options
  protect_from_forgery
  
 
def after_sign_in_path_for(resource)
    if resource.role.name =='admin'
        admin_people_path
    elsif resource.role.name == "student"
        students_path
   elsif resource.role.name == "teacher"
        teacher_details_path
   elsif resource.role.name == "deve"
        content_developers_path
    else
      super
    end
end
  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied"
    redirect_to root_url
  end
end
