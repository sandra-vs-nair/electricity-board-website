class CustomersController < ApplicationController

  before_action :authorize_customer, only: []
  before_action :authorize_staff, only: [:staff_edit, :destroy]
  
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(params.require(:customer).permit(:customer_name,:password,:password_confirmation,:email_id,:address))
    if @customer.save
      session[:customer_id] = @customer.id
      redirect_to '/customer_welcome'
    else
      render 'new'
    end
  end

  def staff_edit
    @customer = Customer.find_by_email_id(params[:email_id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to staff_welcome_path
  end

end
