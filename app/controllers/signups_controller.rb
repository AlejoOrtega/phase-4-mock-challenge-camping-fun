class SignupsController < ApplicationController
    
    def create
        signup= Signup.new(signups_params)
        if signup.save
            render json: signup, include: ['activity'], status: :ok
        else
            render json: {errors: signup.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def signups_params
        params.permit(:camper_id, :activity_id, :time)
    end
end
