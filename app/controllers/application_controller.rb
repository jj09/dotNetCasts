class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

private

	def fb_user
		@fb_user ||= FbUser.find(session[:user_id]) if session[:user_id]
	end
	helper_method :fb_user


end
