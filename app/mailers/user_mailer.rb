class UserMailer < ActionMailer::Base
  default from: "brett.dudo@ecorebox.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.request.subject
  #

  def confirmation(user)
    @user = user
    @url = "http://www.ecorebox.com/"
    mail to:          user.email, 
         subject:     "Welcome to Eco ReBox!"
  end

  def password_reset(user)
    @user = user
    mail to:          user.email, 
         subject:     "Eco ReBox password reset"
  end
end
