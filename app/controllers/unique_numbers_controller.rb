class UniqueNumbersController < ApplicationController
  respond_to :html, :js, :json
  def create
    @box = Box.find(params[:box_id])
    start = params[:start].scan(/\d/).join('').to_i
    params[:quantity].to_i.downto(1) do
      UniqueNumber.create(uin: 'ERB' + "%07d" % start, box_id: @box.id, active: true)
      start += 1
    end
    redirect_to @box
  end

  def index
    respond_to do |format|
      format.html
      format.csv { send_data @export.to_csv }
      format.json { render json: BoxesDatatable.new(view_context) }
    end
  end

  def show
    @uin = UniqueNumber.find(params[:id])
    @box = @uin.box
    @locations = @uin.locations
    @hash = Gmaps4rails.build_markers(@locations) do |loc, marker|
      marker.lat loc.lat
      marker.lng loc.lng
      marker.title loc.postal_code
      marker.picture({
        url: ActionController::Base.helpers.asset_path('map_icon.png'),
        width: 52,
        height: 45,
        anchor: [11,30] })
      marker.shadow({
        url: ActionController::Base.helpers.asset_path('map_icon_shadow.png'),
        width: 110,
        height: 110,
        anchor: [12,34] })            
    end
    @new_location = @uin.locations.build
    respond_with(@hash)
  end
end
