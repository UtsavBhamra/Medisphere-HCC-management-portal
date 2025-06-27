class HccAppointmentsController < ApplicationController
before_action :authenticate_user!
before_action :authorize_hcc_in_charge

    def hcc_view_profile
        @user = current_user
        @hcc_in_charge = current_user.hcc_in_charge
    end

    def hcc_view_appointments
        @students = Student.all
        @appointments = Appointment.all
    end

    def hcc_view_leave_letters
        @students = Student.all
        @leave_letters = LeaveLetter.all
    end

    def hcc_view_particular_appointment
        @appointment = Appointment.find(params[:id])
    end

    def hcc_approve_appointment
        @appointment = Appointment.find(params[:id])
        @appointment.approved = true
        if @appointment.save
            redirect_to hcc_view_appointments_path
        end
    end

    def hcc_mark_visited
        @appointment = Appointment.find(params[:id])
        @appointment.visited = true
        if @appointment.save
            redirect_to hcc_view_appointments_path
        end
    end

    def hcc_view_particular_leave_letter
        @leave_letter = LeaveLetter.find(params[:id])
    end

    def hcc_forward_leave_letter
        @leave_letter = LeaveLetter.find(params[:id])
        @leave_letter.status = 1
        @leave_letter.current_step = 1
        if @leave_letter.save
            redirect_to hcc_view_leave_letters_path,notice: "Leave letter forwarded successfully"
        end
    end

    def hcc_add_appointment_comments
        @appointment = Appointment.find(params[:id])
        if @appointment.update(comments_params)
            redirect_to hcc_view_particular_appointment_path(@appointment.id),notice: "Comment added successfully!"
        else
            redirect_to hcc_view_particular_appointment_path(@appointment.id),notice: "Comment could Not be added! Please try again!"
        end
    end

    def hcc_add_leave_letter_comments
        @leave_letter = LeaveLetter.find(params[:id])
        if @leave_letter.update(ll_comments_params)
            redirect_to hcc_view_particular_leave_letter_path(@leave_letter.id),notice: "Comment added successfully!"
        else
            redirect_to hcc_view_particular_leave_letter_path(@leave_letter.id),notice: "Comment could Not be added! Please try again!"
        end
    end

    def hcc_view_doctors_time_slots
        @doctors = Doctor.all
        @time_slots = TimeSlot.all
    end

    def hcc_new_doctor
        @doctor = Doctor.new
        @time_slots = TimeSlot.all
    end

    def hcc_create_doctor
        @doctor = Doctor.new(doc_params)
        if @doctor.save
            redirect_to hcc_view_doctors_time_slots_path,notice: "Doctor added successfully!"
        else
            redirect_to hcc_new_doctor_path,notice: "Doctor could not be added.Please try again!"
        end
    end

    def hcc_new_time_slot
        @time_slot = TimeSlot.new
    end

    def hcc_create_time_slot
        @time_slot = TimeSlot.new(time_slot_params)
        if @time_slot.begin > @time_slot.end
            redirect_to hcc_view_doctors_time_slots_path,notice: "Start time cannot be before end time !"
            return
        end
        if @time_slot.save
            redirect_to hcc_view_doctors_time_slots_path,notice: "Time Slot Added Successfully"
        else
            redirect_to hcc_new_doctor_path,notice: "Time Slot could not be added.Please try again!"
        end
    end

    private

    def comments_params
        params.require('appointment').permit(:hcc_comments)
    end

    def ll_comments_params
        params.require('leave_letter').permit(:hcc_comments)
    end

    def doc_params 
        params.require('doctor').permit(:name,:speciality,time_slot_ids: [])
    end

    def time_slot_params
        params.require('time_slot').permit(:name,:day,:begin,:end)
    end

    def authorize_hcc_in_charge
        redirect_to root_path,alert: 'Access Denied!' unless current_user&.is_hcc_in_charge?
    end

end
