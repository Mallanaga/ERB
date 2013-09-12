class BoxesController < ApplicationController

  def show
    @box = Box.find(params[:id])
    @locations = @box.locations

    @markers = @locations.to_gmaps4rails do |loc, marker|
      marker.picture({picture: ActionController::Base.helpers.asset_path('map_icon.png'),
                      width: 52,
                      height: 45,
                      marker_anchor: [11,30],
                      shadow_picture: ActionController::Base.helpers.asset_path('map_icon_shadow.png'),
                      shadow_width: 110,
                      shadow_height: 110,
                      shadow_anchor: [12,34]})
    end

    @marker_options = { data: @markers,
                        options: { do_clustering: false,
                                   raw: "{ animation: google.maps.Animation.DROP}" } }
    
    @map_options = { disableDefaultUI: true,
                     center_on_user: false,
                     disableDoubleClickZoom: true,
                     auto_adjust: true,
                     auto_zoom: true,
                     minZoom: 2,
                     maxZoom: 10 }
  end

  def track
    @box = Box.find(params[:uid].upcase)
    redirect_to @box
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Could not locate box #{params[:uid]}..."
    redirect_to root_path 
  end

  def index
    @title = "Eco Reboxes"
    @export = Box.order(:uid)
    @boxes = Box.page(params[:page]).per(50)
    respond_to do |format|
      format.html
      format.csv { send_data @export.to_csv }
      format.json { render json: BoxesDatatable.new(view_context) }
    end
  end

  def create
    number = params[:number].to_i
    number.downto(1) do
      uin = Box.last.uid.split(/B/)[1].to_i
      uin += 1
      uin = 'ERB000' + uin.to_s
      Box.create(uid: uin,
                 company_id: params[:box][:company_id],
                 length: params[:box][:length],
                 width: params[:box][:width],
                 height: params[:box][:height],
                 weight: params[:box][:weight],
                 trips: params[:box][:trips],
                 cost: params[:box][:cost])
    end
    flash[:success] = "#{number} boxes added!"
    redirect_to current_user
  end

  def new
    @box = Box.new
    @companies = Company.all
    company_id = !params['/add'].nil? ? params['/add'][:company_id] : 1
    @selected_company = company_id.to_i  
  end

  def import
    count = Box.import(params[:file])
    if count > 0
      flash[:success] = "#{count} boxes updated!"
    else
      flash[:error] = "No boxes modified..."
    end
    redirect_to root_path
  end
end