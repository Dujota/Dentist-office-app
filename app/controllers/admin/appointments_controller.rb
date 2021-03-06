class Admin::AppointmentsController < Admin::BaseController
  before_action :load_appointment, only: [:confirm, :cancel]

  def index
    @appointments = Appointment.order(created_at: :desc) # we dont care about displaying as the admin is supposed to see all appointments
  end

  def confirm
    @appointment.status = 'confirmed'
    @appointment.save!
    @appointment.send_confirmation_sms
    flash[:notice] = "Appointment has been confirmed"
    redirect_to admin_appointments_url
  end

  def cancel
    @appointment.status = 'canceled'
    @appointment.save!
    flash[:notice] = "Appointment has been thrown in the garbage!"
    redirect_to admin_appointments_url
  end

  private

  def load_appointment
    @appointment = Appointment.find(params[:id])
  end
end

# Admin::AppointmentsController   the Admin:: is the module where AppointmentsController is a class of the module
