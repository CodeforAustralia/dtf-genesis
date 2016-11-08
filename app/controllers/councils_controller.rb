class CouncilsController < ApplicationController
  before_action :set_council, only: [:show, :edit, :update, :destroy]
  def index
    @councils = Council.all 
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
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
