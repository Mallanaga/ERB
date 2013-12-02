class BoxesController < ApplicationController
  respond_to :html, :json
  require 'open-uri'

  def calc
    b = params[:boxes].to_i
    s = params[:shipments].to_i
    case params[:size].to_i
      when 1
        sa = 148
        cb = 0.25
        erb = 1.25
      when 2
        sa = 1152
        cb = 1
        erb = 5
      when 3
        sa = 2240
        cb = 2
        erb = 10
      when 4
        sa = 5232
        cb = 4.5
        erb = 22.5
    end
    
    # ERB box quantity
    erb_q = b/7*s

    # cardboard box quantity
    cb_q = b*52

    # cb cost - erb cost
    @savings = (cb_q*cb) - (erb_q*erb)

    respond_to do |format|
      format.js {@savings}
    end
  end

  def create
    @box = Box.new(params[:box])
    if @box.save
      @box.trips.build(month: Date.today.strftime('%Y-%m-01'), quantity: @box.frequency, retired: 0).save
      flash[:success] = "Box #{@box.uid} added!"
      redirect_to current_user
    else
      render 'boxes/new'
    end
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

  def index
    @title = "Eco Reboxes"
    @export = Box.order(:uid)
    @boxes = Box.page(params[:page]).per(100)
    respond_to do |format|
      format.html
      format.csv { send_data @export.to_csv }
      format.json { render json: BoxesDatatable.new(view_context) }
    end
  end

  def new
    @box = Box.new
    @companies = Company.all
    company_id = !params['/add'].nil? ? params['/add'][:company_id] : 1
    @selected_company = company_id.to_i  
  end

  def show
    @box = Box.find(params[:id])
    cb = OrderDetail.find_all_by_box_id(@box.id).map{ |d| d.cb_price }
    @cb = cb.inject(:+).to_f / cb.size
  end

  def track
    @page = "http://ecorebox.herokuapp.com/boxes/#{params[:uid].upcase}"
    uri = URI.parse("#{@page}")
    @result = Net::HTTP.start(uri.host, uri.port) { |http| http.get(uri.path) }.code
  end

  def update
    @box = Box.find(params[:id])
    @box.update_attributes(params[:box])
    respond_with @box
  end

end