class AppointmentsController < ApplicationController
  before_action :require_logged_in # what this does? before it runs the code, it will calll method require_logged_in an

  def index
    @appointments = current_user.appointments.all

    # the above is the same as Appointment.where(user_id: current_user.id).all -- we can write the above using the has_many association, we are calling current_user helper method

  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id

    if @appointment.save
      flash[:notice] = "Your appointment has been saved"
      redirect_to appointments_url
    else
      render :new
    end
  end

  private
  # this mehtod passes in the params from the form to the create method
  def appointment_params
    params.require(:appointment).permit(:dentist_id, :appointment_at)
  end

end
