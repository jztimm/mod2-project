class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def show
    # if session[:user_id]
    #   redirect_to patient_path(session[:user_id])
    # end
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
    params.require(:patient).permit(:name, :password, :age, :city, :zipcode)
  end

  def find_patient
    @patient = Patient.find(params[:id])
  end

end
