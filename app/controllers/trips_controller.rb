class TripsController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]
  respond_to :html, :json

  def create
    @box = Box.find(params[:box_id])
    month = Date.new(params[:date][:year].to_i, params[:date][:month].to_i)
    @box.update_trips(month)
    redirect_to @box
  end

  def destroy
    @trip = Trip.find(params[:id])
    @box = @trip.box
    @trip.destroy
    flash[:success] = "Month of Trips removed"
    redirect_to @box
  end

  def edit

  end

  def index

  end

  def new
    @trip = Trip.new
  end

  def show

  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update_attributes(params[:trip])
    respond_with @trip
  end

  private
    def check_for_cancel
      if params[:commit] == "Cancel"
        redirect_to root_url
      end
    end
end
