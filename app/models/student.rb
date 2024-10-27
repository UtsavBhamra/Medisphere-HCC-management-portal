class Student < ApplicationRecord
    enum :department, [ :CSE, :IT, :ECE, :EEE, :ME, :CH, :CV, :WROE, :MMA ]
    enum :program_type, [ :BTech, :MTech, :PhD, :MBA, :MSc , :MCA ]

    belongs_to :user
    has_many :appointments,dependent: :destroy
end
