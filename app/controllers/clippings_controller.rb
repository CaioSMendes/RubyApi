class ClippingsController < ApplicationController
  before_action :set_clipping, only: [:show, :update, :destroy]

  # GET /clippings
  def index
    @clippings = Clipping.all

    render json: @clippings
  end

  # GET /clippings/1
  def show
    render json: @clipping
  end

  # POST /clippings
  def create
    @clipping = Clipping.new(clipping_params)

    if @clipping.save
      render json: @clipping, status: :created, location: @clipping
    else
      render json: @clipping.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clippings/1
  def update
    if @clipping.update(clipping_params)
      render json: @clipping
    else
      render json: @clipping.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clippings/1
  def destroy
    @clipping.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clipping
      @clipping = Clipping.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def clipping_params
      params.require(:clipping).permit(:title, :paragraph, :url, :date, :source)
    end
end
