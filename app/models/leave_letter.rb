class LeaveLetter < ApplicationRecord
    enum :status, [:created, :forwarded, :approved]
    enum :current_step, [:hcc, :dsw, :cleared]

    belongs_to :appointment

    validates :applicant_response,:start_date,:end_date,presence: true
end
