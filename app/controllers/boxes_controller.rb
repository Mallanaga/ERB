class BoxesController < ApplicationController
  respond_to :html, :json, :js
  require 'open-uri'

  def calc
    boxes_per_week = params[:boxes].to_f #boxes shipped per week
    # turn_time = params[:shipments].to_i #turn time in days
    shipments_per_year = 365
    life_of_box = 10 #life cycle of a box (10 trips)
    # ss = 1.1 #safety stock (10%)
    case params[:size].to_i
      when 1
        sa = 148 #surface area of box
        cb = 0.25 #cost of cardboard
        erb = 1.25 #cost of Eco ReBox
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
    @erb_q = (boxes_per_week/7*shipments_per_year/life_of_box).ceil

    # cardboard box quantity
    @cb_q = boxes_per_week*52

    # cb cost - erb cost
    @savings = (@cb_q*cb) - (@erb_q*erb)

    respond_with(@savings, @erb_q, @cb_q)
  end

  def create
    @box = Box.new(params[:box])
    @company = Company.find(params[:box][:company_id])
    if @box.save
      flash[:success] = "Box #{@box.uid} added!"
      redirect_to user_path(current_user, company_id: @company.id)
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
    @company = Company.find(params[:company_id])
    @export = @company.boxes.order(:uid)
    respond_to do |format|
      format.html
      format.csv { send_data @export.to_csv, filename: "#{@company.name} Eco ReBoxes.csv" }
    end
  end

  def new
    @box = Box.new
    @company = Company.find(params[:company_id])
  end

  def show
    @box = Box.find(params[:id])
    cb = OrderDetail.find_all_by_box_id(@box.id).map{ |d| d.cb_price }
    @cb = cb.inject(:+).to_f / cb.size
    @new_uin = @box.unique_numbers.build
    @m = [*1..12]
    @y = [*2010..Date.today.year]
  end

  def track
    @uin = UniqueNumber.where(uin: params[:uin].upcase)[0]
    redirect_to [@uin.box, @uin] if @uin
  end

  def update
    @box = Box.find(params[:id])
    @box.update_attributes(params[:box])
    respond_with @box
  end

end