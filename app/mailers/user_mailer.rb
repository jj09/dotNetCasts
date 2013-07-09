class UserMailer < ActionMailer::Base
  default from: "contact@dotnetcasts.com"

  def send_email(user_email, content)
  	@user_email = user_email
  	@content = content
  	mail(to: "jjedrys@ksu.edu", subject: "Email from dotNetCasts.com")
  end
end
