class PagesController < ApplicationController
  
  def home
    @user = User.new
    @trees = Box.all.map{|b| b.trees}.sum
    @houses = (@trees/53).ceil
    @water = Box.all.map{|b| b.water}.sum
    @pools = (@water/20000).ceil
    @electricity = Box.all.map{|b| b.electricity}.sum
    @homes = (@electricity/12000).ceil
  end

  def help
  end

  def contact
    @quote = Quote.new
  end

  def about
  end

  def testimonials
    @companies = Company.page(params[:page]).per(20)
  end
end
