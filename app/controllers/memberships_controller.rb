class MembershipsController < ApplicationController
    def create
        membership = Membership.create!(member_params)
    end

    private

    def member_params
        params.permit(:gym_id, :client_id, :charge)
    end

end
