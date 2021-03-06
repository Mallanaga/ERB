class MailingsController < ApplicationController
  before_filter :admin_user,        only: [:index]
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

  def index
    @mailings = Mailing.order(:id)
    respond_to do |format|
      format.html
      format.csv { send_data @mailings.to_csv, filename: "ERB_Mailing_List.csv" }
    end
  end

private
  def admin_user
    redirect_to(root_path) unless admin?
  end

end
