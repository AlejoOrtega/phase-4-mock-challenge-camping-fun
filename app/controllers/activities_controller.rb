class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    def index
        activities = Activity.all
        render json: activities, status: :ok
    end


    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content, status: :ok
    end

    private
    def record_not_found
        render json: {error: 'Activity not found'}, status: :not_found
    end
    def record_invalid
        render json: 'Data invalid', status: :unprocessable_entity
    end
end
