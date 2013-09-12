class PagesController < ApplicationController
  
  def home
    @user = User.new
    @trees = Company.all.map{|c| c.trees}.sum
    @houses = (@trees/53).floor
    @water = Company.all.map{|c| c.water}.sum
    @pools = (@water/20000).floor
    @electricity = Company.all.map{|c| c.electricity}.sum
    @homes = (@electricity/12000).round(1)
  end

  def help
  end

  def contact
  end

  def about
  end
end
