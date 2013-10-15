class OrdersController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]

  def create
  end

  def edit  
  end

  def index
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @details = @order.order_details
  end
  
  def update
  end

  private
    def check_for_cancel
      if params[:commit] == "Cancel"
        redirect_to root_url
      end
    end
end
