class CompaniesController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to user_path(current_user, company_id: @company.id)
      flash[:success] = "#{@company.name} added as a Client"
    else
      render 'companies/new'
    end
  end

  def destroy
    Company.find(params[:id]).destroy
    flash[:success] = "Company deleted!"
    redirect_to current_user
  end

  def edit  
  end

  def erb
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    @trees = Box.all.map{|b| b.trees}.sum
    @water = Box.all.map{|b| b.water}.sum
    @electricity = Box.all.map{|b| b.electricity}.sum
    respond_to do |format|
      format.html
      format.json {render json: {trees: @trees, water: @water, electricity: @electricity}}
    end
  end

  def index
    @companies = Company.page(params[:page]).per(10)
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
    @box_count = @company.boxes.count
    @current = @company.orders.map{|o| o.order_details.map{|d| d.quantity}.sum}.sum
    @trips = @company.boxes.map { |b| b.trip_count }.sum
  end

  def snippet
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    @company = Company.find(params[:id])
    @trees = @company.trees
    @water = @company.water
    @electricity = @company.electricity
    respond_to do |format|
      format.json {render json: {trees: @trees, water: @water, electricity: @electricity}}
    end
  end
  
  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(name: params[:company][:name],
                                  website: params[:company][:website],
                                  about: params[:company][:about],
                                  testimonial: params[:company][:testimonial])
      flash[:success] = "Company updated"
      redirect_to user_path(current_user, company_id: @company.id)
    else
      redirect_to user_path(current_user, company_id: @company.id)
    end
  end

  private

    def check_for_cancel
      if params[:commit] == "Cancel"
        redirect_to current_user
      end
    end
end
