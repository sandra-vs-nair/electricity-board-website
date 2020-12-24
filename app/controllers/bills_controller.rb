class BillsController < ApplicationController
 
  before_action :authorize_customer, only: []
  before_action :authorize_staff, only: [:create,:edit,:update,:destroy]
  
  def create
    @customer = Customer.find(params[:customer_id])
    @bill = @customer.bills.create(bill_params)
    if @bill.valid?
      redirect_to staff_edit_path(:email_id => @customer.email_id)
    else
      flash[:errors] = @bill.errors.full_messages
      redirect_to staff_edit_path(:email_id => @customer.email_id)
    end
  end

  def edit
     @customer = Customer.find(params[:customer_id])
     @bill = @customer.bills.find(params[:id])
     now = Date.today
     val = Date.new(now.year, now.month, 1)
     if @bill.created_at < val
       flash[:errors] = ["You can't edit the bill after bill delivery!"]
       redirect_to staff_edit_path(:email_id => @customer.email_id)
     end
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @bill = @customer.bills.find(params[:bill_id])

    if @bill.update(bill_params)
      redirect_to staff_edit_path(:email_id => @customer.email_id)
    else
      flash[:errors] = @bill.errors.full_messages
      redirect_to edit_customer_bill_path
    end
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @bill = @customer.bills.find(params[:id])
    @bill.destroy
    redirect_to staff_edit_path(:email_id => @customer.email_id)
  end

  private
    def bill_params
      params.require(:bill).permit(:amount, :month, :status, :year, :staff_name, :staff_email)
    end

end
