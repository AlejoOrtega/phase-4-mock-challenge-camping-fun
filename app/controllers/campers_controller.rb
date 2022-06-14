class CampersController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper.to_json(include: [:activities]), status: :ok
    end

    def create
        camper= Camper.new(camper_params)
        if camper.save
            render json: camper, status: :created
        else
            render json: {errors: camper.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private
    
    def camper_params
        params.permit(:name, :age)
    end
    def record_not_found
        render json: {error:'Camper not found'}, status: :not_found
    end
    def record_invalid
        render json: 'Data invalid', status: :unprocessable_entity
    end
end
