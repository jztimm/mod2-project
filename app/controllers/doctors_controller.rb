class DoctorsController < ApplicationController
  before_action :find_doctor, only: [:show]
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
 
  private

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

end
