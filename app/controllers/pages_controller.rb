class PagesController < ApplicationController
  
  def home
    @user = User.new
    @trees = Box.all.map{|b| b.trees}.sum
    @houses = (@trees/53).floor
    @water = Box.all.map{|b| b.water}.sum
    @pools = (@water/20000).floor
    @electricity = Box.all.map{|b| b.electricity}.sum
    @homes = (@electricity/12000).round(1)
  end

  def help
  end

  def contact
  end

  def about
  end
end
