class CardFormatsController < ApplicationController
  before_action :set_card_format, only: [:show, :update, :destroy]

  # GET /card_formats
  def index
    @card_formats = CardFormat.all

    render json: @card_formats
  end

  # GET /card_formats/1
  def show
    render json: @card_format
  end

  # POST /card_formats
  def create
    @card_format = CardFormat.new(card_format_params)

    if @card_format.save
      render json: @card_format, status: :created, location: @card_format
    else
      render json: @card_format.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /card_formats/1
  def update
    if @card_format.update(card_format_params)
      render json: @card_format
    else
      render json: @card_format.errors, status: :unprocessable_entity
    end
  end

  # DELETE /card_formats/1
  def destroy
    @card_format.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_format
      @card_format = CardFormat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_format_params
      params.require(:card_format).permit(:card_id, :format_id, :legality)
    end
end
