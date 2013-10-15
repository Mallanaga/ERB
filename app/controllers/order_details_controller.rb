class OrderDetailsController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]

  def create
  end

  def edit  
  end

  def index
  end

  def new
    @detail = OrderDetail.new
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
