class CustomersController < ApplicationController

  before_action :authorize_customer, only: []
  before_action :authorize_staff, only: []
  
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

end
