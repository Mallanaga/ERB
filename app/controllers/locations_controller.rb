class LocationsController < ApplicationController
  def create
    @uin = UniqueNumber.find(params[:unique_number_id])
    params[:location][:unique_number_id] = @uin.id
    @location = Location.create(params[:location])
    if @location.save
      flash[:success] = "Trip to #{@location.postal_code} added"
      redirect_to [@uin.box, @uin]
    else
      render 'unique_numbers/show'
    end
  end

  def import
    count = Location.import(params[:file])
    if count > 0
      flash[:success] = "Updated #{count} trips"
    else
      flash[:error] = "Nothing to update"
    end
    redirect_to current_user
  end
end
