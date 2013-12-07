class OrdersController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]
  respond_to :html, :json

  def create
    @order = Order.create(params[:order])
    if @order.save
      flash[:success] = "Order #{@order.invoice} added!"
      redirect_to current_user      
    else
      render 'boxes/new'
    end
  end

  def edit  
  end

  def index
  end

  def new
    @order = Order.new
    @details = @order.order_details.build
    @boxes = Company.find(params[:company_id]).boxes
    @b = @boxes.first
  end

  def show
    @order = Order.find(params[:id])
    @details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update_attributes(params[:order])
    respond_with @order
  end

  private
    def check_for_cancel
      if params[:commit] == "Cancel"
        redirect_to root_url
      end
    end
end
