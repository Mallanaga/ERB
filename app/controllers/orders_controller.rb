class OrdersController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]
  respond_to :html, :json

  def create
    @order = Order.new(params[:order])
    @boxes = params[:boxes]
    if @order.save
      @boxes.each do |b|
        @box = Box.where(company_id: @order.company_id,
                         uid: b.uid,
                         frequency: b.frequency,
                         active: b.active,
                         length: b.length,
                         width: b.width,
                         height: b.height,
                         weight: b.weight).first_or_create
        @box.trips.build(month: Date.today.strftime('%Y-%m-01'), quantity: @box.frequency, retired: 0).save
        @order.order_details.build(box_id: @box.id,
                                   quantity: b.quantity,
                                   box_price: b.box_price,
                                   cb_price: b.cb_price,
                                   mould_fees: b.mould_fees).save
      end
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
