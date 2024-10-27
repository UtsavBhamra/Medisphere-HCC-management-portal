class AppointmentInfoMailer < ApplicationMailer

    def appointment_creation_email
        @user = params[:user]
        @appointment = params[:appointment]

        mail(to:@user.email, subject:"Appointment created successfully")
    end
    
end
