class UserMailer < ApplicationMailer
  default :from => "keralastateelectricity@gmail.com",:content_type => "text/html"
 
  def customer_email(customer)
    @customer = customer
    mail = "No"
    @customer.bills.each do |bill|
      if bill.status == "Due"
        mail = "Yes"
        break
      end
    end
    if mail == "Yes"
      mail(:to => customer.email_id, :subject => "Pending bill information - KSEB")
    end
  end

  def staff_email(staff)
    @staff = staff
    mail(:to => staff.email_id, :subject => "Staff account created - KSEB")
  end

end
