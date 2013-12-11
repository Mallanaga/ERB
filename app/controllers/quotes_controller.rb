class QuotesController < ApplicationController
  def create
    @quote = Quote.new(params[:quote])
    if @quote.save
      Mailing.create(email: @quote.email, name: @quote.name) if params[:subscribe]
      UserMailer.quote(@quote).deliver
      flash[:success] = "We'll be in touch, #{@quote.name}!"
      redirect_to root_url 
    else
      render 'pages/contact'
    end
  end
  
end
