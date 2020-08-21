class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  has_secure_password
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :birthday, presence: true
  validates :city, presence: true
  validates :zipcode, :length => { :minimum => 5, :maximum => 6 }, :numericality => true, allow_blank: true
  validates_each :birthday do |record, attr, value|
    record.errors.add attr, "is not a valid date. You must be at
least 16 year old to sign in." if value > Date.new((Date.today.year -
18),(Date.today.month),(Date.today.day))
  end

  def calc_age
    Time.now.year - self.birthday.year
  end
end
