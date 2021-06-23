class MtgSetsController < ApplicationController
  before_action :set_mtg_set, only: [:show, :update, :destroy]

  # GET /mtg_sets
  def index
    @mtg_sets = MtgSet.all

    render json: @mtg_sets
  end

  # GET /mtg_sets/1
  def show
    render json: @mtg_set
  end

  # POST /mtg_sets
  def create
    @mtg_set = MtgSet.new(mtg_set_params)

    if @mtg_set.save
      render json: @mtg_set, status: :created, location: @mtg_set
    else
      render json: @mtg_set.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mtg_sets/1
  def update
    if @mtg_set.update(mtg_set_params)
      render json: @mtg_set
    else
      render json: @mtg_set.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mtg_sets/1
  def destroy
    @mtg_set.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mtg_set
      @mtg_set = MtgSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mtg_set_params
      params.require(:mtg_set).permit(:name, :code, :release_date)
    end
end
