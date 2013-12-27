class OrdersController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]
  respond_to :html, :json, :js
    
  def create
    @order = Order.new(params[:order])
    @company = Company.find(params[:order][:company_id])
    @details = @order.order_details
    @boxes = @company.boxes
    if @order.save
      p = 1-@order.delivered_on.day.to_f/31
      @details.each do |d|
        order_box = d.box
        q = (order_box.frequency*p).ceil
        order_box.trips.build(month: @order.delivered_on.strftime('%Y-%m-01'), quantity: q, retired: 0).save
      end
      flash[:success] = "Order #{@order.invoice} added!"
      redirect_to user_path(current_user, company_id: @order.company_id)
    else
      render 'orders/new'
    end
  end

  def destroy
    Order.find(params[:id]).destroy
    flash[:success] = "Order destroyed"
    redirect_to current_user
  end

  def edit
  end

  def index
  end

  def new
    @order = Order.new
    @company = Company.find(params[:company_id])
    @details = @order.order_details.build
    @boxes = @company.boxes
  end

  def show
    @order = Order.find(params[:id])
    @tax = @order.tax == 0 ? 'none' : "#{@order.tax}%"
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
