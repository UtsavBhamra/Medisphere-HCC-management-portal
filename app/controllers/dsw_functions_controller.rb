class DswFunctionsController < ApplicationController
before_action :authenticate_user!
before_action :authorize_dsw

    def dsw_view_profile
        @user = current_user
        @dsw = current_user.dean_student_welfare
    end

    def dsw_view_leave_letters
        @leave_letters = LeaveLetter.all.where(status:1)
    end

    def dsw_view_particular_leave_letter
        @leave_letter = LeaveLetter.find(params[:id])
        @status  = @leave_letter.status
    end

    def dsw_approve_leave_letter
        @leave_letter = LeaveLetter.find(params[:id])
        if @leave_letter.status=="forwarded" and @leave_letter.current_step=="dsw"
            @leave_letter.status= 2
            @leave_letter.current_step= 2
            if @leave_letter.save
                redirect_to dsw_view_leave_letters_path,notice: "Leave Letter approved successfully"
            end
        else
            redirect_to dsw_view_leave_letters_path,notice: "this leave letter can't be approved"
            puts @leave_letter.status
            puts @leave_letter.current_step
        end
    end

    def dsw_add_leave_letter_comments
        @leave_letter = LeaveLetter.find(params[:id])
        if @leave_letter.update(dsw_comments_params)
            redirect_to dsw_view_particular_leave_letter_path(@leave_letter.id),notice: "Comment added successfully!"
        else
            redirect_to dsw_view_particular_leave_letter_path(@leave_letter.id),notice: "Comment could Not be added! Please try again!"
        end
    end

    private

    def dsw_comments_params
        params.require(:leave_letter).permit(:dsw_comments)
    end

    def authorize_dsw
        redirect_to root_path,alert: 'Access Denied!' unless current_user&.is_dsw?
    end
end
