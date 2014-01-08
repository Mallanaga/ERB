class PagesController < ApplicationController
  
  def home
    @user = User.new
    @trees = Box.all.map{|b| b.trees}.sum
    @houses = (@trees/53).ceil
    @water = Box.all.map{|b| b.water}.sum
    @pools = (@water/20000).ceil
    @electricity = Box.all.map{|b| b.electricity}.sum
    @homes = (@electricity/12000).ceil

    set_meta_tags og: {
      title: 'Eco ReBox LLC.',
      type: 'website',
      description: 'Eco ReBox supplies reusable plastic boxes to companies wanting to save the environment, and money.',
      url: root_url,
      image: ActionController::Base.helpers.asset_path('logo_square.png'),
      video: 'http://www.youtube.com/watch?v=2znwYZNyOkU'
    }
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
