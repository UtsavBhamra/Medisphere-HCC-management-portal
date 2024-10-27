Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'dashboard#index'

  get '/students/view_profile',to: 'student_appointments#student_view_profile',as: 'student_view_profile'
  get '/students/view_appointments',to: 'student_appointments#view_appointments',as: 'student_view_appointments'
  get '/students/view_appointment/:id',to: 'student_appointments#student_view_particular_appointment',as: 'student_view_particular_appointment'
  delete '/students/delete_appointment/:id',to: 'student_appointments#delete_appointment',as: 'delete_student_appointment'
  get '/students/new_appointment',to: 'student_appointments#student_new_appointment',as: 'student_new_appointment'
  post '/students/create_appointment',to: 'student_appointments#student_create_appointment',as: 'student_create_appointment'
  get '/students/view_leave_letters',to: 'student_appointments#student_view_leave_letters',as: 'student_view_leave_letters'
  get '/students/view_leave_letter/:id',to: 'student_appointments#student_view_particular_leave_letter',as: 'student_view_particular_leave_letter'
  get '/students/new_leave_letter/:appoint_id',to: 'student_appointments#student_new_leave_letter',as: 'student_new_leave_letter'
  post '/students/create_leave_letter/:id',to: 'student_appointments#student_create_leave_letter',as: 'student_create_leave_letter'
  get '/students/get_time_slots_by_doctor/:id',to: 'student_appointments#student_get_time_slots_by_doctor',as: 'student_get_time_slots_by_doctor'


  get '/hcc_in_charge/view_profile',to: 'hcc_appointments#hcc_view_profile',as: 'hcc_view_profile'
  get '/hcc_in_charge/view_appointments',to: 'hcc_appointments#hcc_view_appointments',as: 'hcc_view_appointments'
  get '/hcc_in_charge/view_leave_letters',to: 'hcc_appointments#hcc_view_leave_letters',as: 'hcc_view_leave_letters'
  patch '/hcc_in_charge/add_appointment_comments/:id',to: 'hcc_appointments#hcc_add_appointment_comments',as: 'hcc_add_appointment_comments'
  get '/hcc_in_charge/view_appointment/:id',to: 'hcc_appointments#hcc_view_particular_appointment',as: 'hcc_view_particular_appointment'
  patch '/hcc_in_charge/approve_appointment/:id',to: 'hcc_appointments#hcc_approve_appointment',as: 'hcc_approve_appointment'
  patch '/hcc_in_charge/mark_visited/:id',to: 'hcc_appointments#hcc_mark_visited',as: 'hcc_mark_visited'
  get '/hcc_in_charge/view_leave_letter/:id',to: 'hcc_appointments#hcc_view_particular_leave_letter',as: 'hcc_view_particular_leave_letter'
  post '/hcc_in_charge/forward_leave_letter/:id',to: 'hcc_appointments#hcc_forward_leave_letter',as: 'hcc_forward_leave_letter'
  patch '/hcc_in_charge/add_leave_letter_comments/:id',to: 'hcc_appointments#hcc_add_leave_letter_comments',as: 'hcc_add_leave_letter_comments'
  get '/hcc_in_charge/view_doctors_and_timeslots',to: 'hcc_appointments#hcc_view_doctors_time_slots',as: 'hcc_view_doctors_time_slots'
  get '/hcc_in_charge/add_doctor',to: 'hcc_appointments#hcc_new_doctor',as: 'hcc_new_doctor'
  post '/hcc_in_charge/add_doctor',to: 'hcc_appointments#hcc_create_doctor',as: 'hcc_create_doctor'
  get '/hcc_in_charge/add_time_slot',to: 'hcc_appointments#hcc_new_time_slot',as: 'hcc_new_time_slot'
  post '/hcc_in_charge/create_time_slot',to: 'hcc_appointments#hcc_create_time_slot',as: 'hcc_create_time_slot'


  get '/dsw/view_profile',to: 'dsw_functions#dsw_view_profile',as: 'dsw_view_profile'
  get '/dsw/view_leave_letters',to: 'dsw_functions#dsw_view_leave_letters',as: 'dsw_view_leave_letters'
  get '/dsw/view_leave_letter/:id',to: 'dsw_functions#dsw_view_particular_leave_letter',as: 'dsw_view_particular_leave_letter'
  post '/dsw/approve_leave_letter/:id',to: 'dsw_functions#dsw_approve_leave_letter',as: 'dsw_approve_leave_letter'
  patch '/dsw/add_leave_letter_comments/:id',to: 'dsw_functions#dsw_add_leave_letter_comments',as: 'dsw_add_leave_letter_comments'

end
