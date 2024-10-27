class DashboardController < ApplicationController
    before_action :authenticate_user!,only: [:index]

    def index
        puts current_user.role
        if current_user.role=='student'
            render :student_dash
        elsif current_user.role=='hcc_in_charge'
            render :hcc_dash
        elsif current_user.role=='dsw'
            render :dsw_dash
        else
            render :unsigned_user
        end
    end
end
