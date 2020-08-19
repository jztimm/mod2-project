class AppointmentsController < ApplicationController
   before_action :find_appointment, only: [:show, :edit, :update, :destroy]

   def index
      @appointments = Appointment.all
   end

   def new
      @appointment = Appointment.new
      unless params[:zipcode].nil? || params[:zipcode].empty?
         redirect_to doctors_path(@doctors, zipcode: params[:zipcode])
       end
   end

   def show
   end

   def create
      @appointment = Appointment.create(appointments_params)
      redirect_to patient_path(@appointment.patient)
   end

   def edit
   end

   def update
      @appointment.update(appointments_params)
      redirect_to appointment_path(@appointment)
   end

   def destroy
      @appointment.destroy
      redirect_to appointments_path
   end


   private

   def appointments_params
      params.require(:appointment).permit(:patient_id, :doctor_id, :condition, :date, :time, :additional_info)
   end

   def find_appointment
      @appointment = Appointment.find(params[:id])
   end

end
