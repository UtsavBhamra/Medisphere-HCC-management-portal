class HccInCharge < ApplicationRecord
    validates :staff_id, presence: true
    validates :staff_id, uniqueness: true

    belongs_to :user
end
