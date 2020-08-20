class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :age, presence: true
  validates :age, numericality: {greater_than: 25, less_than: 150}
  validates :specialty, presence: true
  validates :city, presence: true
  validates :zipcode, :length => { :minimum => 5, :maximum => 6 }, :numericality => true, allow_blank: true


end
