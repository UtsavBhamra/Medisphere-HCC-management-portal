class TimeSlot < ApplicationRecord
    enum :day, [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

    has_and_belongs_to_many :doctors
    has_many :appointments,dependent: :destroy

    def display_name_with_day
        "#{name} - #{day}"
    end
end
