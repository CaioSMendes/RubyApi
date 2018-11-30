class Api::V1::ClippingsController < ApplicationController
    before_action :set_clipping, only: [:show, :update, :destroy]
    before_action :require_authorization!, only: [:show, :update, :destroy]
    
    # GET /api/v1/cllipings
    
    def index
        @clippings = current_user.clippings
        render json: @clippings
    end
    
    # GET /api/v1/clliping/1
    
    def show
        render json: @clipping
    end
    
    # POST /api/v1/cllipings
    
    def create
        @clipping = Clipping.new(clipping_params.merge(user: current_user))
            if  @clipping.save
                render json:  @clipping, status: :created
            else
                render json:  @clipping.errors, status: :unprocessable_entity
            end
    end
    
    # PATCH/PUT /api/v1/cllipings/1
    
    def update    
        if  @clipping.update(clipping_params)
            render json:  @clipping
        else
            render json:  @clipping.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /api/v1/cllipings/1
    
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
    
    def require_authorization!
        unless current_user == @clipping.user
        render json: {}, status: :forbidden
        end
    end
end

