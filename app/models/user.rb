class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :student,dependent: :destroy
  accepts_nested_attributes_for :student

  has_one :hcc_in_charge,dependent: :destroy
  accepts_nested_attributes_for :hcc_in_charge

  has_one :dean_student_welfare,dependent: :destroy
  accepts_nested_attributes_for :dean_student_welfare
  
  enum :role, [:student, :hcc_in_charge, :dsw]

  validates :name,:role,presence: true
  
  def is_student?
    role=='student'
  end

  def is_hcc_in_charge?
    role=='hcc_in_charge'
  end

  def is_dsw?
    role=='dsw'
  end

end
