class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def send_email
  	UserMailer.send_email(params[:from], params[:content]).deliver

  	respond_to do |format|
  		flash[:success] = "Email was sent."
  		format.html { redirect_to contact_path }
  	end
  end
end
