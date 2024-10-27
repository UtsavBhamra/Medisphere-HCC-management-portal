class StudentAppointmentsController < ApplicationController
before_action :authenticate_user!
before_action :authorize_student

    def student_view_profile
        @user = current_user
        @student = current_user.student
    end

    def view_appointments
        @student = current_user.student
        @all_appointments = @student.appointments 
    end

    def delete_appointment
        @appointment = Appointment.find(params[:id])
        if @appointment.destroy
            redirect_to student_view_appointments_path,notice: "Appointment deleted successfully"
        else
            redirect_to student_view_appointments_path,notice: "Appointment not deleted !!"
        end
    end

    def student_new_appointment
        @appointment = Appointment.new
        @doctors = Doctor.all
        @time_slots = TimeSlot.all
    end

    def student_create_appointment
        @student = current_user.student
        puts @appointment_params
        @appointment = @student.appointments.build(appointment_params)        
        if @appointment.doctor.time_slots.exists?(@appointment.time_slot_id)==false
            redirect_to student_view_appointments_path,notice:"Doctor Not available at selected time slot !!!"
            return
        end
        @appointment.visited = false
        @appointment.approved = false
        if @appointment.save
            redirect_to student_view_appointments_path,notice: "Appointment cretaed successfully"
            AppointmentInfoMailer.with(user: current_user,appointment: @appointment).appointment_creation_email.deliver_later
        else
            @time_slots = TimeSlot.all
            render :student_new_appointment
        end
    end

    def student_view_leave_letters
        @student = current_user.student
        @all_appointments = @student.appointments.where(visited: true)
    end

    def student_view_particular_leave_letter
        @leave_letter = LeaveLetter.find(params[:id])
    end

    def student_new_leave_letter
        @leave_letter = LeaveLetter.new
        @appointment_id = params[:appoint_id]
    end

    def student_create_leave_letter
        @appointment = current_user.student.appointments.find(params[:id])
        @appointment_id = params[:id]
        @leave_letter = @appointment.build_leave_letter(leave_letter_params)
        if @leave_letter.start_date > @leave_letter.end_date
            redirect_to student_view_leave_letters_path,notice: "Start date cannot be before end date !"
            return
        end
        @leave_letter.status = 0
        @leave_letter.current_step = 0
        if @leave_letter.save 
            redirect_to student_view_leave_letters_path,notice: "Leave Letter Submitted Successfully"
            
        else
            render :student_new_leave_letter
        end
    end

    def student_view_particular_appointment
        @appointment = Appointment.find(params[:id])
        if @appointment.student = current_user.student
            render :student_view_particular_appointment
        else
            render plain: "Not Allowed to view"
        end
    end

    def student_get_time_slots_by_doctor
        @doctor = Doctor.find(params[:id])
        puts @doctor
        @time_slots = @doctor.time_slots
        puts "all time slots- \n"
        puts @time_slots
        render json: { time_slots: @time_slots }
    end

    private

    def appointment_params
        params.require(:appointment).permit(:reason,:preferred_slot,:severity,:student_id,:time_slot_id,:doctor_id)
    end

    def leave_letter_params
        params.require(:leave_letter).permit(:title,:applicant_response,:start_date,:end_date)
    end

    def authorize_student
        redirect_to root_path,alert: 'Access denied!' unless current_user&.is_student?
    end
end

# use student.build_appointment(name:"utsav",age:10) for one to one
# student.appointments.build(name:"utsav",age:19) for one to many