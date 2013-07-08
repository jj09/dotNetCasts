class UserMailer < ActionMailer::Base
  default from: "contact@dotnetcasts.com"
  default to: "jjedrys@ksu.edu"

  def send_email(user_email, content)
  	# recipients "jjedrys@ksu.edu"
  	# from "contact@dotnetcasts.com"
  	# subject "Emailfrom donNetCasts.com"
  	# body :user_email => user_email, :content => content
  	@user_email = user_email
  	@content = content
  	mail(subject: "Email from dotNetCasts.com")
  end
end
