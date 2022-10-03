class SpicesController < ApplicationController

    # GET /birds
    def index
        spices = Spice.all 
        render json: spices 
    end

    # POST /birds
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # PATCH /spices/:id
    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice
    end

    # DELETE /spices/:id
    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
            # render json: {}
        else
            render json: {error: "Spice not found" }, status: :not_found
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
    
end
