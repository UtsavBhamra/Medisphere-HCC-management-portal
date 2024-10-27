# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
    @student = @user.build_student
    @hcc_in_charge = @user.build_hcc_in_charge
    @dsw = @user.build_dean_student_welfare
    super
  end

  # POST /resource
  class Users::RegistrationsController < Devise::RegistrationsController
    def create
      super do |user|
        puts "Debug: User role is #{user.role}"
        puts student_params
        puts hcc_params
        puts dsw_params
          case user.role
          when 'student'
            user.build_student(student_params)
          when 'hcc_in_charge'
            user.build_hcc_in_charge(hcc_params)
          when 'dsw'
            user.build_dean_student_welfare(dsw_params)
          end

          user.save if user.persisted?
      end
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation,:name, :role)
  end

  def student_params
    params.require(:user).require(:student).permit(:student_id, :department, :program_type)
  end

  def hcc_params
    params.require(:user).require(:hcc_in_charge).permit(:staff_id)
  end

  def dsw_params
    params.require(:user).require(:dean_student_welfare).permit(:staff_id)
  end

end
