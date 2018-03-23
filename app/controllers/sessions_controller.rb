class SessionsController < ApplicationController

  layout 'session',only:[:new,:create]	
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to user
  	else
  		flash.now[:danger] = '填写的邮箱/密码中存在错误!'
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end
end
