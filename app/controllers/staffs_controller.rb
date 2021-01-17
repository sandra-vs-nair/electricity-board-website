class StaffsController < ApplicationController

  before_action :authorize_staff, only: []
  before_action :authorize_customer, only: []
  http_basic_authenticate_with name: "admin", password: "admin", only: [:create]
 
  def index
  end

  def new
    @staff = Staff.new
  end
 
  def create
    @staff = Staff.create(params.require(:staff).permit(:staff_name,:password,:password_confirmation,:email_id,:address))
    if @staff.save
      session[:staff_id] = @staff.id
      UserMailer.staff_email(@staff).deliver
      redirect_to '/staff_welcome'
    else
      render 'new'
    end
  end

end

