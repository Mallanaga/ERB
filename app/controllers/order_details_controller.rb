class OrderDetailsController < ApplicationController
  respond_to :json

  def update
    @detail = OrderDetail.find(params[:id])
    @detail.update_attributes(params[:order_detail])
    respond_with @detail
  end
end
