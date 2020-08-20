class Appointment < ApplicationRecord
   belongs_to :patient
   belongs_to :doctor

   validates :patient_id, presence: true
   validates :doctor_id, presence: true
   validates :condition, :length => {:minimum => 3}, allow_blank: true
   validates :additional_info, :length => { :minimum => 5, :maximum => 250 }, allow_blank: false
   validates :date, presence: true
   validates :time, presence: true

end
