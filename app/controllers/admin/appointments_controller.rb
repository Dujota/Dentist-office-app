class Admin::AppointmentsController < Admin::BaseController
  def index
    @appointments = Appointment.all # we dont care about displaying as the admin is supposed to see all appointments
  end
end

# Admin::AppointmentsController   the Admin:: is the module where AppointmentsController is a class of the module
