module SessionsHelper

	def sign_in(user)
		cookies.permanent[:token] = user.token
		self.current_user = user
	end

	def sign_out		
		self.current_user = nil
		cookies.delete(:token)
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_token(cookies[:token])
	end

	def current_user?(user)
		user == current_user
	end	

	def signed_in_user
	  unless signed_in?
	    store_location
	    redirect_to signin_path, notice: "Please sign in."
	  end
	end

  	def store_location
		session[:return_to] = request.fullpath
	end

	def admin?
		signed_in? && current_user.admin?
	end

	def signed_in_admin
    unless admin?
      store_location
      redirect_to signin_path, notice: "Please sign in as admin."
    end
  end

end
