class QuotesController < ApplicationController
  def create
    @quote = Quote.new(params[:quote])
    if @quote.save
      UserMailer.quote(@quote).deliver
      flash[:success] = "We'll be in touch, #{@quote.name}!"
      redirect_to root_url 
    else
      render 'quotes/new'
    end
  end

  def new
    @quote = Quote.new
  end
end
