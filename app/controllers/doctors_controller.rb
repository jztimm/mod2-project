class DoctorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
    unless params[:zipcode].nil? || params[:zipcode].empty?
      @doctors = @doctors.where(zipcode: params[:zipcode])
    end
  end
  

  def show
    unless params[:zipcode].nil? || params[:zipcode].empty?
      redirect_to doctors_path(@doctors, zipcode: params[:zipcode])
    end
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.create(doctor_params)
    redirect_to doctor_path(@doctor)
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
    params.require(:doctor).permit(:name, :specialty)
  end

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

end
