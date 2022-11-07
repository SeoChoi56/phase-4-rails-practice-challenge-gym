class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        gyms = Gym.all
        render json: gyms
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def destroy
        #destroy memberships for the gym
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content 
    end

    private 

    def render_not_found_response(e)
        render json: { error: e.record.errors.full_messages }, status: :not_found
    end

end
