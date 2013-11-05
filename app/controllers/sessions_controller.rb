class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase.strip)
    if user && user.authenticate(params[:password])
      sign_in_user user
      flash[:success] = "Welcome back, #{user.first_name}"
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out_user
    redirect_to root_url
  end
end
