class Doctor < ApplicationRecord
    enum :speciality, [ :ENT, :general, :emergency, :gastro, :mental, :ortho]

    validates :name,:speciality,presence: true

    has_and_belongs_to_many :time_slots
    has_many :appointments,dependent: :destroy
end
