class SessionsController < ApplicationController
  
  before_action :authorize_customer, only: [:customer_welcome] 
  before_action :authorize_staff, only: [:staff_welcome]
  
  def new
  end
  
  def create
    if params[:staff]
      @staff = Staff.find_by(email_id: params[:email_id])
      if @staff && @staff.authenticate(params[:password])
        session[:staff_id] = @staff.id
        redirect_to '/staff_welcome'
      else
        flash[:alert] = "Wrong username or password"
        redirect_to '/login'
      end
    else
      @customer = Customer.find_by(email_id: params[:email_id])
      if @customer && @customer.authenticate(params[:password])
        session[:customer_id] = @customer.id
        redirect_to '/customer_welcome'
      else
        flash[:alert] = "Wrong username or password"
        redirect_to '/login'
      end
    end
  end

  def customer_welcome
    @customer = Customer.find_by(id: session[:customer_id])
  end

  def staff_welcome
  end

  def destroy
    session[:customer_id] = nil
    session[:staff_id] = nil
    redirect_to :controller => 'welcome', :action => 'index' 
  end

end
