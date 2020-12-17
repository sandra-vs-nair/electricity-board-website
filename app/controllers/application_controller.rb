class ApplicationController < ActionController::Base

  before_action :authorize_customer
  before_action :authorize_staff
  helper_method :current_customer
  helper_method :current_staff
  helper_method :customer_logged_in?
  helper_method :staff_logged_in?

  def current_customer
    Customer.find_by(id: session[:customer_id])
  end

  def customer_logged_in?       
    !current_customer.nil?
  end

  def current_staff
    Staff.find_by(id: session[:staff_id])
  end

  def staff_logged_in?
    !current_staff.nil?
  end

  def authorize_customer
    if staff_logged_in?
      session[:staff_id] = nil
      flash[:alert] = "Login as a customer to view this page."
      redirect_to '/login' 
    else
      redirect_to '/login' unless customer_logged_in?
    end
  end

  def authorize_staff
    if customer_logged_in?
      session[:customer_id] = nil
      flash[:alert] = "Login as a staff to view this page."
      redirect_to '/login'
    else
      redirect_to '/login' unless staff_logged_in?
    end
  end

end
