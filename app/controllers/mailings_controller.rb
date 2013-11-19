class MailingsController < ApplicationController
  def create
    @mailing = Mailing.new(params[:mailing])
    if params[:email_confirm] == params[:mailing][:email]
      if @mailing.save
        flash[:success] = "We'll be in touch!"
        redirect_to root_path
      else
        flash[:error] = 'Something went wrong there, reenter your information'
        redirect_to root_path
      end
    else
      flash[:error] = 'Email confirmation was incorrect'
      redirect_to root_path
    end
  end
end
