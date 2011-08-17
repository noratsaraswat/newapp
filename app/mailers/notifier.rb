class Notifier < ActionMailer::Base
  def support_notification(sender)
	    @sender = sender
	    mail(:to => "mvjohn100@gmail.com",
	         :from => sender.email,
	         :subject => "Query")
	 end

end
