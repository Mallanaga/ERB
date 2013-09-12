class CompaniesController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to root_path
      flash[:success] = "Company created."
    else
      render 'companies/new'
    end
  end

  def edit  
  end

  def index
    @companies = Company.page(params[:page]).per(10)
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
    b = @company.boxes.map { |box| box.trips * box.weight }.sum
    @box_count = @company.boxes.count
    @current = @company.boxes.map { |box| box.locations.count > 0 ? 1 : 0 }.sum
  end

  def snippet
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
                                  acquired: params[:company][:acquired],
                                  about: params[:company][:about],
                                  testimonial: params[:company][:testimonial])
      flash[:success] = "Company updated"
      redirect_to current_user
    else
      redirect_to current_user
    end
  end

  private

    def check_for_cancel
      if params[:commit] == "Cancel"
        redirect_to root_url
      end
    end
end
