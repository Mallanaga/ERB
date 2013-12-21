class LocationsController < ApplicationController
  def import
    count = Location.import(params[:file])
    if count > 0
      flash[:success] = "Box locations updated with #{count} trips!"
    else
      flash[:error] = "No box locations updated..."
    end
    redirect_to current_user
  end
end
