class Appointment < ApplicationRecord
    enum :severity, [:mild ,:urgent, :emergency]

    belongs_to :student 
    belongs_to :time_slot
    belongs_to :doctor
    has_one :leave_letter,dependent: :destroy
end
