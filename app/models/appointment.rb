class Appointment < ApplicationRecord
   belongs_to :patient
   belongs_to :doctor

   validates :patient_id, presence: true
   validates :doctor_id, presence: true
   validates :condition, allow_blank: true
   validates :zipcode, :length => { :minimum => 5, :maximum => 6 }, :numericality => true, allow_blank: true
   validates :additional_info, :length => { :minimum => 5, :maximum => 250 }, allow_blank: false
   validates :date, allow_blank: false
   validates :time, allow_blank: false

end
