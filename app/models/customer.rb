class Customer < ApplicationRecord

  has_many :bills
  has_secure_password 
  EMAIL_REG = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i
  validates :customer_name, :presence => true, :length => { :in => 3..20 }
  validates :email_id, :presence => true, :uniqueness => true, :format => EMAIL_REG
  #validates :password, :confirmation => true   #No need for this line since has_secure_password will take care of it.
  validates :address, :presence => true
  validates_length_of :password, :in => 6..20, :on => :create

end
