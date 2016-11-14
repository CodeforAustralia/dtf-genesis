class CprScoresController < ApplicationController
  before_action :set_cpr_score, only: [:show, :edit, :update, :destroy]

  # GET /cpr_scores
  # GET /cpr_scores.json
  def index
    @cpr_scores = CprScore.all
  end

  # GET /cpr_scores/1
  # GET /cpr_scores/1.json
  def show
  end

  # GET /cpr_scores/new
  def new
    @cpr_score = CprScore.new
  end

  # GET /cpr_scores/1/edit
  def edit
  end

  # POST /cpr_scores
  # POST /cpr_scores.json
  def create
    @cpr_score = CprScore.new(cpr_score_params)

    respond_to do |format|
      if @cpr_score.save
        format.html { redirect_to @cpr_score, notice: 'Cpr score was successfully created.' }
        format.json { render :show, status: :created, location: @cpr_score }
      else
        format.html { render :new }
        format.json { render json: @cpr_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpr_scores/1
  # PATCH/PUT /cpr_scores/1.json
  def update
    respond_to do |format|
      if @cpr_score.update(cpr_score_params)
        format.html { redirect_to @cpr_score, notice: 'Cpr score was successfully updated.' }
        format.json { render :show, status: :ok, location: @cpr_score }
      else
        format.html { render :edit }
        format.json { render json: @cpr_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpr_scores/1
  # DELETE /cpr_scores/1.json
  def destroy
    @cpr_score.destroy
    respond_to do |format|
      format.html { redirect_to cpr_scores_url, notice: 'Cpr score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpr_score
      @cpr_score = CprScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpr_score_params
      params.require(:cpr_score).permit(:time_management, :work_standard, :quality_management_system, :personnel, :subcontractors, :contract_admin, :coop_relations, :health_and_safety, :industrial_relations, :environmental_management, :training_management, :design_contractor, :indigenous_participation, :cpr_report_id)
    end
end
