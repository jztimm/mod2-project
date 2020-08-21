class DoctorsController < ApplicationController
  before_action :find_doctor, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:index, :show]

  def index
    @doctors = Doctor.all
    unless params[:zipcode].blank?
      @doctors = @doctors.where(zipcode: params[:zipcode])
    end
  end
  

  def show
    unless params[:zipcode].blank?
      redirect_to doctors_path(@doctors, zipcode: params[:zipcode])
    end
  end

  def new
    @doctor = Doctor.new
  end

  def create
    doctor = Doctor.create(doctor_params)
    if doctor.valid?
      session[:user_id] = doctor.id
      redirect_to doctor
    else
      flash[:my_error] = doctor.errors.full_messages
      redirect_to new_doctor_path
    end
  end

  def edit
  end

  def update
    @doctor.update(doctor_params)
    redirect_to doctor_path(@doctor)
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

 
  private

  def doctor_params
    params.require(:doctor).permit(:name, :birthday, :specialty, :city, :zipcode, :state, :address)
  end

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

end
