class OrdersController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]
  respond_to :html, :json, :js

  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:success] = "Order #{@order.invoice} added!"
      redirect_to current_user      
    else
      render 'boxes/new'
    end
  end

  def add_detail
    @order = Order.build
    @boxes = Company.find(params[:company_id]).boxes
    @b = @boxes.first
    @ci = Time.now.to_i
    respond_with(@order, @boxes, @b, @ci)
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
