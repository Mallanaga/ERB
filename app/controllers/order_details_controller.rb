class OrderDetailsController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]
  respond_to :js

  def create
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
    respond_with(@detail, @boxes)
  end

  def show
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
