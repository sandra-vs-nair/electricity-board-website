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
    @customers = Customer.all
    @months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
    @years = Date.today.year-1 .. Date.today.year

    @values = []
    @years.each do |year|
    @months.each do |month|
    @sum = 0
    @due = 0
    @year = year #'2020'
    @month = month
    
    @rec = Bill.where(year: @year, :month => @month)

    if @rec.present?
      @paids = Bill.where(year: @year, :month => @month, :status => 'Paid')
   
      @paids.each do |paid|
        @sum = @sum + paid.amount
      end
        
      @dues = Bill.where(:year => @year, :month => @month, :status => 'Due')
      @dues.each do |due|
        @due = @due + due.amount
      end
     
      @arr = [@year,@month,@sum,@due]
      @values.push(@arr)
    end
    end
    end

  end

  def destroy
    session[:customer_id] = nil
    session[:staff_id] = nil
    redirect_to :controller => 'welcome', :action => 'index' 
  end

end
