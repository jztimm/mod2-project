class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:new, :create]

  def index
    @patients = Patient.all
  end

  def show
    unless params[:zipcode].nil? || params[:zipcode].empty?
      redirect_to doctors_path(@doctors, zipcode: params[:zipcode])
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    patient = Patient.create(patient_params)
    if patient.valid?
      session[:user_id] = patient.id
      redirect_to patient
    else
      flash[:my_error] = patient.errors.full_messages
      redirect_to new_patient_path
    end
  end

  def edit
  end

  def update
    @patient.update(patient_params)
    redirect_to patient_path(@patient)
  end

  def destroy
    @patient.destroy
    redirect_to '/'
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :password, :age, :city, :zipcode, :address, :state)
  end

  def find_patient
    @patient = Patient.find(params[:id])
  end

end
