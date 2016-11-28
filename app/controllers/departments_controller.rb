class DepartmentsController < ApplicationController
  # before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

end
