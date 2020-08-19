class SessionsController < ApplicationController

   def logout
      session.delete(:user_id)
      redirect_to doctors_path
   end

   def new
   end

   def create
      patient = Patient.find_by(name: params[:session][:name])

      if patient && patient.authenticate(params[:session][:password])
         session[:user_id] = patient.id
         redirect_to patient
      else
         flash[:my_error] = "Name or Password is Incorrect"
         redirect_to new_login_path
      end
   end

end
