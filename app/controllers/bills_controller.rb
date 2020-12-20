class BillsController < ApplicationController
 
  before_action :authorize_customer, only: []
  before_action :authorize_staff, only: []
  
  def create
    @customer = Customer.find(params[:customer_id])
    @bill = @customer.bills.create(bill_params)
    redirect_to '/customer_welcome'
  end

  private
    def bill_params
      params.require(:bill).permit(:amount, :month, :status)
    end

end


