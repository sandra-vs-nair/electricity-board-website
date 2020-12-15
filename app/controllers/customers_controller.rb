class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(params.require(:customer).permit(:customer_name,:password,:password_confirmation,:email_id,:address))
    if @customer.save
      render 'index'
    else
      render 'new'
    end
  end
end
