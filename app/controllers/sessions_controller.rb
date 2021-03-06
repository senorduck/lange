class SessionsController < ApplicationController
  layout "application"

  def create
    user = User.authenticate(params[:session][:email_address],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email / password"
      render 'new'
    else
      sign_in(user)
      redirect_back_or(root_path) 
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
