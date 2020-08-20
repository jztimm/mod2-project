class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  has_secure_password
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :age, presence: true
  validates :age, numericality: {greater_than: 0, less_than: 150}
  validates :city, presence: true
  validates :zipcode, :length => { :minimum => 5, :maximum => 6 }, :numericality => true, allow_blank: true

end
