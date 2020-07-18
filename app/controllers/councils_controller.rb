class CouncilsController < ApplicationController
  before_action :set_council, only: [:show, :edit, :update, :destroy]
  def index
    @councils = Council.all

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @councils }
      format.atom
    end 
  end

  def show
    @council = Council.find(params[:id])
  end

  def new
    @council = Council.new
  end

  def create
    @council = Council.create(council_params)
  end

  def edit
  end

  def update
    @council = Council.update_attributes(council_params)
  end

  def destroy
    @council.destroy
  end

  private 
    def set_council
      @council = Council.find(params[:id])
    end

    def council_params
      params.require(:council).permit(:codename, :name, :shortname, :council_type, :region_code)
    end

end
